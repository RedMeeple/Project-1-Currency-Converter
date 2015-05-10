require "./currency.rb"
require "./currency_converter.rb"

class CurrencyTrader
  def initialize(converters, origin)
    @converters = converters
    @origin = origin
  end

  def best_trade
    raise MissingCurrencyError if @converters.length < 2

    best_value = 0
    best_trade = ''
    start = @origin
    trade_route = []

    @converters.each_cons(2) do |first_rate, second_rate|
      first_rate.hash.each_key do |country|
        puts "In hash key: " + country + ", " + start.code
        first_currency = first_rate.convert(start, country)
        second_currency = second_rate.convert(first_currency, start.code)

        puts "RA: " + second_currency.amount.to_s
        if (second_currency.amount/start.amount) > best_value
          best_value = second_currency.amount/start.amount
          puts "BV: " + best_value.to_s
          best_trade = country
        end
      end
      start = best_value
      trade_route << best_trade
      puts trade_route
    end
    "If you trade to #{trade_route} you will end up with #{best_value.code} #{best_value.amount}"
  end

  def should_i_trade(destination)
    if (@converters[0].hash[destination]/@converters[1].hash[destination]) > 1
      true
    else
      false
    end
  end
end

class MissingCurrencyError < StandardError
  def message
    "At least two Currency Converters are needed"
  end
end



#
# @connverters.each_cons(2) do |first_rate, second_rate|
#   first_rate.hash.each_key do |country|
#     puts "In hash key: " + country + ", " + start.code
#     trade = CurrencyConverter.new(first_rate.hash)
#     trade_currency = trade.convert(start, country)
#     mature_currency = trade_currency * (second_rate.hash[country] / first_rate.hash[country])
#     puts mature_currency.code
#     mature = CurrencyConverter.new(second_rate.hash)
#     revert_currency = mature.convert(mature_currency, start.code)
#     ## revert_amount not calculating correctly
#     puts "RA: " + revert_currency.amount.to_s
#     if revert_currency > best_value
#       best_value = revert_currency
#       puts "BV: " + best_value.amount.to_s
#       best_trade = country
#     end
#   end
#   start = best_value
#   puts start.amount
#   trade_route << best_trade
#   puts trade_route
# end

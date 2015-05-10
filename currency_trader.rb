require "./currency.rb"
require "./currency_converter.rb"

class CurrencyTrader
  def initialize(converters, origin)
    @converters = converters
    @origin = origin
  end

  def best_trade
    raise MissingCurrencyError if @converters.length < 2

    best_value = @origin
    best_trade = ''
    start = @origin
    trade_route = []

    @converters.each_cons(2) do |first_rate, second_rate|
      first_rate.hash.each_key do |country|
        puts "In hash key: " + country + ", " + start.code
        trade = CurrencyConverter.new(first_rate.hash)
        trade_amount = trade.convert(start, country)
        mature_amount = trade_amount * (second_rate.hash[country] / first_rate.hash[country])
        puts mature_amount.code
        mature = CurrencyConverter.new(second_rate.hash)
        revert_amount = mature.convert(mature_amount, start.code)
        ## revert_amount not calculating correctly
        puts "RA: " + revert_amount.amount.to_s
        if revert_amount > best_value
          best_value = revert_amount
          puts "BV: " + best_value.amount.to_s
          best_trade = country
        end
      end
      start = best_value
      puts start.amount
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

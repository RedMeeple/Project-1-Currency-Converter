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
    spot = 0
    trade_route = []

    until spot == @converters.length-1
      @converters[spot].hash.each_key do |country|
        trade = CurrencyConverter.new(@converters[spot].hash)
        trade_amount = trade.convert(start, country)
        mature = CurrencyConverter.new(@converters[spot+1].hash)
        mature_amount = mature.convert(trade_amount, country)
        revert_amount = mature.convert(mature_amount, @origin.code)
        if (revert_amount <=> @origin) == 1
          best_value = revert_amount
          best_trade = country
        end
      end
      spot += 1
      start = best_value
      trade_route << best_trade
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

require "./currency.rb"
require "./currency_converter.rb"

class CurrencyTrader
  def initialize(converters, origin)
    @converters = converters
    @origin = origin
  end

  def best_trade
    raise MissingCurrencyError if @converters.length < 2

    best_ratio = 0
    best_trade = ''
    start = @origin
    spot = 0
    trade_route = []
    until spot == @converters.length-1
      @converters[spot].hash.each_value do |rate|
        if ((rate/@converters[spot+1].hash[@converters[spot].hash.key(rate)]) <=> best_ratio) == 1
          best_ratio = rate/@converters[spot+1].hash[@converters[spot].hash.key(rate)]
          best_trade = @converters[spot].hash.key(rate)
        end
      end
      spot += 1
      start = best_trade
      trade_route << best_trade
    end
    "If you trade to #{trade_route} you will end up with #{@origin.code} #{best_ratio*@origin.amount}"
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

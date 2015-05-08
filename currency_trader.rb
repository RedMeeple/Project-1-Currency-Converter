require "./currency.rb"
require "./currency_converter.rb"

class CurrencyTrader
  def initialize(converters, origin)
    @converters = converters
    @origin = origin
  end

  def best_trade
    best_ratio = 0
    best_trade = ""
    @converters[0].hash.each_value do |rate|
      if ((rate/@converters[1].hash[@converters[0].hash.key(rate)]) <=> best_ratio) == 1
        best_ratio = rate/@converters[1].hash[@converters[0].hash.key(rate)]
        best_trade = @converters[0].hash.key(rate)
      end
    end
    return best_trade
  end

  def should_i_trade(destination)
    if (@converters[0].hash[destination]/@converters[1].hash[destination]) > 1
      true
    else
      false
    end
  end
end

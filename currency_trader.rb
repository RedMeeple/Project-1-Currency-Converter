require "./currency.rb"
require "./currency_converter.rb"

class CurrencyTrader
  def initialize(first, second, origin)
    @first = first #origin
    @second = second #destination
    @origin = origin
  end

  def best_trade
    best_ratio = 0
    best_trade = ""
    @first.hash.each_value do |rate|
      if ((rate/@second.hash[@first.hash.key(rate)]) <=> best_ratio) == 1
        best_ratio = rate/@second.hash[@first.hash.key(rate)]
        best_trade = @first.hash.key(rate)
      end
    end
    return best_trade
  end

  def should_i_trade(destination)
    if (@first.hash[destination]/@second.hash[destination]) > 1
      true
    else
      false
    end
  end
end

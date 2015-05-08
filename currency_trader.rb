require "./currency.rb"
require "./currency_converter.rb"

class CurrencyTrader
  def initialize(origin, destination = '')
    @origin = origin
    @destination = destination
    @conversion_rates_to_USD = {'USD' => 1, 'EUR' => 0.887, 'JPY' => 119.822,
      'GBP' => 0.647, 'RUB' => 50.775, 'INR' => 63.927, 'KRW' => 1091.49,
      'NGN' => 199.049, 'UAH' => 20.49, 'LAK' => 8088.57, 'PHP' => 44.597,
      'MNT' => 1947.33, 'TRY' => 2.677, 'THB' => 33.458, 'SAR' => 3.75,
      'PYG' => 5047.19, 'CRC' => 532.203, 'KZT' => 185.88, 'VND' => 21691.44} # As of May 8, 2015
    @previous_conversion_rates_to_USD = {'USD' => 1, 'EUR' => 0.721, 'JPY' => 101.665,
      'GBP' => 0.59, 'RUB' => 34.997, 'INR' => 59.895, 'KRW' => 1022.64,
      'NGN' => 161.145, 'UAH' => 11.599, 'LAK' => 8037.569, 'PHP' => 43.967,
      'MNT' => 1802.508, 'TRY' => 2.07, 'THB' => 32.505, 'SAR' => 3.75,
      'PYG' => 4443.44, 'CRC' => 554.248, 'KZT' => 181.879, 'VND' => 21084.147} # As of May 8, 2014
  end

  def best_trade
    best_ratio = 0
    best_trade = ""
    @previous_conversion_rates_to_USD.each_value do |rate|
      if ((rate/@conversion_rates_to_USD[@previous_conversion_rates_to_USD.key(rate)]) <=> best_ratio) == 1
        best_ratio = rate/@conversion_rates_to_USD[@previous_conversion_rates_to_USD.key(rate)]
        best_trade = @previous_conversion_rates_to_USD.key(rate)
      end
    end
    return best_trade
  end

  def should_i_trade

  end
end

first = Currency.new("$2.00")

testit = CurrencyTrader.new(first, 'EUR')

puts testit.best_trade

#
# past = Currency.new(foreign, (@previous_conversion_rates_to_USD[foreign] /
# @previous_conversion_rates_to_USD[@origin.code]) * @origin.amount)
# present = Currency.new(@origin.code, (@conversion_rates_to_USD[@origin.code] /
# @conversion_rates_to_USD[past.code]) * past.amount)

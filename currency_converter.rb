require "./currency.rb"

class CurrencyConverter
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
    @conversion_rates_to_USD = {'USD' => 1, 'EUR' => 0.887, 'JPY' => 119.822,
      'GBP' => 0.647, 'RUB' => 50.775, 'INR' => 63.927, 'KRW' => 1091.49,
      'NGN' => 199.049, 'UAH' => 20.49, 'LAK' => 8088.57, 'PHP' => 44.597,
      'MNT' => 1947.33, 'TRY' => 2.677, 'THB' => 33.458, 'SAR' => 3.75,
      'PYG' => 5047.19, 'CRC' => 532.203, 'KZT' => 185.88, 'VND' => 21691.44} # As of May 8, 2015
  end

  def convert
    if @conversion_rates_to_USD[@destination].nil? || @conversion_rates_to_USD[@origin.code].nil?
      raise UnknownCurrencyCodeError
    end
    Currency.new(@destination, (@conversion_rates_to_USD[@destination] /
    @conversion_rates_to_USD[@origin.code]) * @origin.amount)
  end
end

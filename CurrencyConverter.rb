require "./CurrencyClass.rb"

class Currency_Converter
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
    @conversion_rates_to_USD = {'USD' => 1, 'EUR' => 0.887, 'JPY' => 119.822,
      'GBP' => 0.647, 'RUB' => 50.775, 'INR' => 63.927, 'KRW' => 1091.49,
      'NGN' => 199.049, 'UAH' => 20.49}
  end

  def convert
    Currency.new(@destination, (@conversion_rates_to_USD[@destination] /
    @conversion_rates_to_USD[@origin.code]) * @origin.amount)
  end
end

first = Currency.new("USD2.00")

testit = Currency_Converter.new(first, 'EUR')

puts testit.convert.amount

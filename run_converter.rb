require "./currency.rb"
require "./currency_converter.rb"
require "./currency_trader.rb"

current_conversions_to_USD = {'USD' => 1, 'EUR' => 0.887, 'JPY' => 119.822,
  'GBP' => 0.647, 'RUB' => 50.775, 'INR' => 63.927, 'KRW' => 1091.49,
  'NGN' => 199.049, 'UAH' => 20.49, 'LAK' => 8088.57, 'PHP' => 44.597,
  'MNT' => 1947.33, 'TRY' => 2.677, 'THB' => 33.458, 'SAR' => 3.75,
  'PYG' => 5047.19, 'CRC' => 532.203, 'KZT' => 185.88, 'VND' => 21691.44} # As of May 8, 2015

previous_conversion_rates_to_USD = {'USD' => 1, 'EUR' => 0.721, 'JPY' => 101.665,
  'GBP' => 0.59, 'RUB' => 34.997, 'INR' => 59.895, 'KRW' => 1022.64,
  'NGN' => 161.145, 'UAH' => 11.599, 'LAK' => 8037.569, 'PHP' => 43.967,
  'MNT' => 1802.508, 'TRY' => 2.07, 'THB' => 32.505, 'SAR' => 3.75,
  'PYG' => 4443.44, 'CRC' => 554.248, 'KZT' => 181.879, 'VND' => 21084.147} # As of May 8, 2014

pretend_conversions_to_USD = {'USD' => 1, 'EUR' => 0.65, 'JPY' => 105,
  'GBP' => 0.98, 'RUB' => 24, 'INR' => 82, 'KRW' => 1090,
  'NGN' => 170, 'UAH' => 15, 'LAK' => 8200, 'PHP' => 48,
  'MNT' => 1650, 'TRY' => 3, 'THB' => 37, 'SAR' => 3.75,
  'PYG' => 4400, 'CRC' => 550, 'KZT' => 186, 'VND' => 21006} # As of my imagination


first = Currency.new("UAH25.00")

present = CurrencyConverter.new(current_conversions_to_USD)


old = CurrencyConverter.new(previous_conversion_rates_to_USD)

pretend = CurrencyConverter.new(pretend_conversions_to_USD)

trading = CurrencyTrader.new([old, present, pretend], first)

puts trading.best_trade

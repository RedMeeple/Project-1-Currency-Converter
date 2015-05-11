require "./currency.rb"
require "./currency_converter.rb"
require "./currency_trader.rb"

previous_conversion_rates_to_USD = {'USD' => 1.0, 'EUR' => 0.721, 'JPY' => 101.665,
  'GBP' => 0.59, 'RUB' => 34.997, 'INR' => 59.895, 'KRW' => 1022.64,
  'NGN' => 161.145, 'UAH' => 11.599, 'LAK' => 8037.569, 'PHP' => 43.967,
  'MNT' => 1802.508, 'TRY' => 2.07, 'THB' => 32.505, 'SAR' => 3.75,
  'PYG' => 4443.44, 'CRC' => 554.248, 'KZT' => 181.879, 'VND' => 21084.147} # As of May 8, 2014

current_conversions_to_USD = {'USD' => 1.0, 'EUR' => 0.887, 'JPY' => 119.822,
  'GBP' => 0.647, 'RUB' => 50.775, 'INR' => 63.927, 'KRW' => 1091.49,
  'NGN' => 199.049, 'UAH' => 20.49, 'LAK' => 8088.57, 'PHP' => 44.597,
  'MNT' => 1947.33, 'TRY' => 3.677, 'THB' => 33.458, 'SAR' => 3.75,
  'PYG' => 5047.19, 'CRC' => 532.203, 'KZT' => 185.88, 'VND' => 21691.44} # As of May 8, 2015

pretend_conversions_to_USD = {'USD' => 1.0, 'EUR' => 0.65, 'JPY' => 105.0,
  'GBP' => 0.98, 'RUB' => 24.0, 'INR' => 152.0, 'KRW' => 1090.0,
  'NGN' => 170.0, 'UAH' => 15.0, 'LAK' => 8200.0, 'PHP' => 48.0,
  'MNT' => 1650.0, 'TRY' => 3.0, 'THB' => 37.0, 'SAR' => 3.75,
  'PYG' => 4400.0, 'CRC' => 550.0, 'KZT' => 186.0, 'VND' => 21006.0} # As of my imagination



first = Currency.new("PHP100.00")

past = CurrencyConverter.new(previous_conversion_rates_to_USD)
present = CurrencyConverter.new(current_conversions_to_USD)
pretend = CurrencyConverter.new(pretend_conversions_to_USD)

trading = CurrencyTrader.new([past, present, pretend], first)

puts trading.best_trade

puts "yes" if trading.should_i_trade('MNT')
puts "definitely" if trading.should_i_trade('CRC')

require "./currency.rb"

class CurrencyConverter
  def initialize(hash)
    @conversion_rates_to_USD = hash
  end

  def convert(origin, destination)
    if @conversion_rates_to_USD[destination].nil? || @conversion_rates_to_USD[origin.code].nil?
      raise UnknownCurrencyCodeError
    end
    Currency.new(destination, (@conversion_rates_to_USD[destination] /
    @conversion_rates_to_USD[origin.code]) * origin.amount)
  end

  def hash
    @conversion_rates_to_USD
  end

end

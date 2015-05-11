require "./currency.rb"

class CurrencyConverter
  attr_reader :hash

  def initialize(hash)
    @hash = hash
  end

  def convert(origin, destination_code)
    if @hash[destination_code].nil? || @hash[origin.code].nil?
      raise UnknownCurrencyCodeError
    end
    Currency.new(destination_code, (@hash[destination_code] /
      @hash[origin.code]) * origin.amount)
  end
end

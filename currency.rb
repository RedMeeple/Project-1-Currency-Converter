class Currency
  include Comparable

  def initialize(entry, optional_amount = "000.00")
    @codes = {
      '$' => 'USD' , '€' => 'EUR', '¥' => 'JPY', '£' => 'GBP', '₽' => 'RUB',
      '₨' => 'INR', '₩' => 'KRW', '₦' => 'NGN', '₴' => 'UAH', '₭' => 'LAK',
      '₱' => 'PHP', '₮' => 'MNT', '₺' => 'TRY', '฿' => 'THB', '﷼' => 'SAR',
      '₹' => 'INR', '₲' => 'PYG', '₡' => 'CRC', '₸' => 'KZT', '₫' => 'VND' }
    if optional_amount == "000.00"
      @code = ""
      while entry[0].to_i.to_s != entry[0]
        @code << entry[0]
        entry[0] = ''
        @code.strip!
      end
      if @code.length != 3
        if @codes[@code].nil?
          raise UnknownCurrencyCodeError
        end
        @code = @codes[@code]
      end
      @amount = entry.to_f
    else
      @code = entry
      @amount = optional_amount.to_f
    end
  end

  def code
    @code
  end

  def amount
    @amount
  end

  def == (other_currency)
    @code == other_currency.code && @amount == other_currency.amount
  end

  def <=> (other_currency)
    if @amount < other_currency.amount
      -1
    elsif @amount > other_currency.amount
      1
    else
      0
    end
  end

  def - (other_currency)
    if @code != other_currency.code
      raise DifferentCurrencyCodeError
    else
      Currency.new(@code, @amount - other_currency.amount)
    end
  end

  def + (other_currency)
    if @code != other_currency.code
      raise DifferentCurrencyCodeError
    else
      Currency.new(@code, @amount + other_currency.amount)
    end
  end

  def * (number)
    Currency.new(@code, @amount*number)
  end

  def / (number)
    Currency.new(@code, @amount/number)
  end

end

class DifferentCurrencyCodeError < StandardError
  def message
    "You can only add and subtract equivalent currencies."
  end
end

class UnknownCurrencyCodeError < StandardError
  def message
      "Please try a different currency code."
  end
end

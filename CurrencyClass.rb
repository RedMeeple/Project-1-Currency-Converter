class Currency
  def initialize(entry)
    @code = ""
    while entry[0].to_i.to_s != entry[0]
      @code << entry[0]
      entry[0] = ''
    end
    @amount = entry.to_f
  end
  def code
    @code
  end
  def amount
    @amount
  end
  def == (other_currency)
    true if self.code == other_currency.code && self.amount == other_currency.amount
  end
  def - (other_currency)
    subtracted = "#{self.code} #{self.amount - other_currency.amount}"
  end
  def + (other_currency)
    added = "#{self.code}#{self.amount + other_currency.amount}"
  end
end


try = Currency.new("$2.00")
another = Currency.new("$1.05")

puts try - another

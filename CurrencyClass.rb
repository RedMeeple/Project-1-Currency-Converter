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
    if self.code != other_currency.code
      nil
      #raise error message
    elsif self.amount == other_currency.amount
      true
    else
      false
    end
  end
end


try = Currency.new("$2.05")
another = Currency.new("$2.05")


if try == another
  puts "Yay!"
else
  puts "Keep going"
end

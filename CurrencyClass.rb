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
end


try = Currency.new("$2.05")
puts try.code
puts try.amount

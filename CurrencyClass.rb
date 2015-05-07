class Currency(code, amount)
  def initialize
    @code = code
    @amount = amount.to_f
  end
end

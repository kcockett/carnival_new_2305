class Visitor

  attr_reader :name, :height, :spending_money, :preferences

  def initialize(name, height, money)
    @name = name.to_s
    @height = height.to_i
    @spending_money = cash_conversion(money)
    @preferences = []
  end

  def cash_conversion(money)
    dollar_integer = money.delete("$").to_i
  end

  def add_preference(name)
    @preferences << name.to_s.to_sym
  end
end
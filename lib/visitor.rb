class Visitor

  attr_reader :name, :height, :spending_money, :preferences

  def initialize(name, height, money)
    @name = name
    @height = height
    @spending_money = cash_conversion(money)
    @preferences = []
  end

  def cash_conversion(money)
    dollar_integer = money.delete("$").to_i
  end

  def add_preference(name)
    @preferences << name
  end

  def tall_enough?(min_height)
    @height >= min_height
  end
end
class Customer

  attr_reader :name, :money, :age, :drunkenness

  def initialize(name, money, age, drunkenness)
    @name = name
    @money = money
    @age = age
    @drunkenness = drunkenness
  end

  def legal()
    @age >= 18
  end

  def buy_drink(drink)
    if sufficient_funds?(drink) && legal
      @money -= drink.price()
      @drunkenness += drink.alcohol_level()
    end
  end

  def sufficient_funds?(drink)
    @money >= drink.price()
  end

  def buy_food(food)
    @money -= food.price()
  end

  def eat_food(food)
    @drunkenness -= food.rejuvenation_level()
  end

end

class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks)

    @name = name
    @till = till
    @drinks = drinks

  end

  def drink_count()
    return @drinks.count()
  end

  def sell_drink(customer, drink)
    if customer.legal() == false
      return "You are underage."
    elsif customer.drunkenness >= 30
      return "You are too drunk."
    elsif @drinks.include?(drink)
      customer.buy_drink(drink)
      @till += drink.price()
      return drink.name()
    end
  end

  # def sells_drink()
  #   @drinks.shift()
  # end
  #
  # def takes_money(drink)
  #   @till += drink.price()
  # end

end

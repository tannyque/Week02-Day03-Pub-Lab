require 'minitest/autorun'
require 'minitest/rg'
require_relative '../pub'
require_relative '../drink'
require_relative("../customer")

class PubTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Beer", 3, 10)
    @drink2 = Drink.new("Cider", 4, 15)
    @customer1 = Customer.new("Tanny", 15, 26, 0)
    @customer2 = Customer.new("Jon", 5, 15, 0)
    @pub = Pub.new("Brew", 100, [@drink1, @drink2])
  end

  def test_has_name()
    assert_equal("Brew", @pub.name())
  end

  def test_money_in_till()
    assert_equal(100, @pub.till())
  end

  def test_pub_has_2_drinks()
    assert_equal(2, @pub.drink_count())
  end

  def test_sell_drink()
    result = @pub.sell_drink(@customer1, @drink1)
    assert_equal("Beer", result)
    assert_equal(12, @customer1.money())
    assert_equal(103, @pub.till())
  end

  def test_customer_underage()
    result = @pub.sell_drink(@customer2, @drink1)
    assert_equal("You are underage.", result)
  end

  def test_customer_too_drunk()
    @customer3 = Customer.new("Jane", 20, 30, 35)
    result = @pub.sell_drink(@customer3, @drink2)
    assert_equal("You are too drunk.", result)
  end

  # def test_gives_drink__pub_stock_goes_down()
  #   drink = @pub.sells_drink()
  #   assert_equal(1, @pub.drink_count())
  # end
  #
  # def test_add_drink_price_to_till()
  #   @pub.takes_money(@drink1)
  #   assert_equal(103, @pub.till())
  # end

end

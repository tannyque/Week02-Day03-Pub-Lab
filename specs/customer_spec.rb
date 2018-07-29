require 'minitest/autorun'
require 'minitest/rg'
require_relative '../customer'
require_relative '../drink'
require_relative("../food")

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Tanny", 15, 26, 0)
    @customer2 = Customer.new("Jon", 5, 15, 0)
    @drink = Drink.new("Beer", 3, 10)
    @food = Food.new("Crisps", 1, 5)
  end

  def test_has_name()
    assert_equal("Tanny", @customer1.name())
  end

  def test_has_money()
    assert_equal(15, @customer1.money())
  end

  def test_has_age()
    assert_equal(26, @customer1.age())
  end

  def test_has_drunkenness()
    assert_equal(0, @customer1.drunkenness())
  end

  def test_customer_is_legal()
    assert_equal(true, @customer1.legal())
    assert_equal(false, @customer2.legal())

  end

  def test_sufficient_funds_true
    assert_equal(true, @customer1.sufficient_funds?(@drink))
  end

  def test_sufficient_funds_false()
    @customer1.buy_drink(@drink)
    @customer1.buy_drink(@drink)
    @customer1.buy_drink(@drink)
    @customer1.buy_drink(@drink)
    @customer1.buy_drink(@drink)
    @customer1.buy_drink(@drink)
    assert_equal(false, @customer1.sufficient_funds?(@drink))
  end

  def test_customer_buy_drink()
    @customer1.buy_drink(@drink)
    assert_equal(12, @customer1.money())
    assert_equal(10, @customer1.drunkenness())
  end

  def test_customer_insufficident_funds
    @customer1.buy_drink(@drink)
    @customer1.buy_drink(@drink)
    @customer1.buy_drink(@drink)
    @customer1.buy_drink(@drink)
    @customer1.buy_drink(@drink)
    assert_equal(0, @customer1.money())
    assert_equal(50, @customer1.drunkenness())
  end

  def test_customer_buy_food()
    @customer1.buy_food(@food)
    assert_equal(14, @customer1.money())
  end

  def test_customer_eats_food()
    @customer1.buy_drink(@drink)
    @customer1.eat_food(@food)
    assert_equal(5, @customer1.drunkenness())
  end

end

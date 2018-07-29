require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")

class DrinkTest < MiniTest::Test

  def setup
    @drink = Drink.new("Beer", 3, 10)
  end

  def test_has_name()
    assert_equal("Beer", @drink.name())
  end

  def test_has_price()
    assert_equal(3, @drink.price())
  end

  def test_has_alcohol_level()
    assert_equal(10, @drink.alcohol_level())
  end

end

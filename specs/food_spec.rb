require("minitest/autorun")
require("minitest/rg")
require_relative("../food")

class FoodTest < MiniTest::Test

  def setup()
    @food = Food.new("Crisps", 1, 5)
  end

  def test_food_has_name()
    assert_equal("Crisps", @food.name())
  end

  def test_food_has_price()
    assert_equal(1, @food.price())
  end

  def test_food_has_rejuvenation_level
    assert_equal(5, @food.rejuvenation_level)
  end

end

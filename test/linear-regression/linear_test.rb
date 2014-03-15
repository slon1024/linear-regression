require "linear-regression"
require "test/unit"

module Regression
  class LinearTests < Test::Unit::TestCase 
    def setup
      @xs = [150, 160, 170, 180, 190, 200, 190, 180, 170, 160]
      @ys = [51, 63, 68, 79, 90, 97, 88, 50, 63, 60]

      @linear = Linear.new(@xs, @ys)
    end

    def test_slope
      expected =  0.87333
      actual = @linear.slope
      assert_in_delta(expected, actual, 0.00001)
    end

    def test_intercept
      expected = -81.93333
      actual = @linear.intercept
      assert_in_delta(expected, actual, 0.00001)
    end
  end
end
require "linear-regression"
require "test/unit"

module Regression
  class BaseTests < Test::Unit::TestCase
    def setup
      @base = Base.new

      @xs = [150, 160, 170, 180, 190, 200, 190, 180, 170, 160]
      @ys = [51, 63, 68, 79, 90, 97, 88, 50, 63, 60]
    end

    def test_mean_with_nil_shoul_be_raise
      assert_raise RuntimeError do
        @base.mean(nil)
      end
    end

    def test_mean_with_array_should_be_equal_to_expected
      expected = 175.0
      actual = @base.mean(@xs)
      assert_equal(expected, actual)
    end

    def test_covariance_with_diff_length_xs_and_ys_should_be_raise
      assert_raise RuntimeError do 
        @base.covariance(@xs, @ys[1..@ys.length])
      end
    end

    def test_covariance_with_xs_and_ys_should_be_equal_to_expected
      expected = 196.50
      actual = @base.covariance(@xs, @ys)

      assert_in_delta(expected, actual, 0.000001)
    end

    def test_standard_deviation_with_nil_should_be_raise
      assert_raise RuntimeError do
        @base.standard_deviation(nil)
      end
    end

    def test_standard_deviation_with_xs_should_be_equal_to_expected
      expected = 15.0
      actual = @base.standard_deviation(@xs)
      assert_equal(expected, actual)
    end
  end
end
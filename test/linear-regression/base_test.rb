require "linear-regression"
require "test/unit"

module Regression
  class BaseTests < Test::Unit::TestCase
    def setup
      @base = Base.new

      @xs = [150, 160, 170, 180, 190, 200, 190, 180, 170, 160]
      @ys = [51, 63, 68, 79, 90, 97, 88, 50, 63, 60]
    end

    def test_ev_with_nil_shoul_be_raise
      assert_raise RuntimeError do
        @base.ev(nil)
      end
    end

    def test_ev_with_array_should_be_equal_to_expected
      expected = 175.0
      actual = @base.ev(@xs)
      assert_equal(expected, actual)
    end

    def test_cov_with_diff_length_xs_and_ys_should_be_raise
      assert_raise RuntimeError do 
        @base.cov(@xs, @ys[1..@ys.length])
      end
    end

    def test_cov_with_xs_and_ys_should_be_equal_to_expected
      expected = 196.50
      actual = @base.cov(@xs, @ys)

      assert_in_delta(expected, actual, 0.000001)
    end

    def test_stdev_with_nil_should_be_raise
      assert_raise RuntimeError do
        @base.stdev(nil)
      end
    end

    def test_stdev_with_xs_should_be_equal_to_expected
      expected = 15.0
      actual = @base.stdev(@xs)
      assert_equal(expected, actual)
    end
  end
end
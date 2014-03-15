module Regression
  require "linear-regression"
  require "test/unit"

  class RegressionTests < Test::Unit::TestCase
    def setup
      @linear = Linear.new

      @xs = [150, 160, 170, 180, 190, 200, 190, 180, 170, 160]
      @ys = [51, 63, 68, 79, 90, 97, 88, 50, 63, 60]

    end

    def teardown
      @linear = nil
    end

    def test_ev_with_nil_shoul_be_raise
      assert_raise RuntimeError do
        @linear.ev(nil)
      end
    end

    def test_ev_with_array_should_be_equal_to_expected
      expected = 175.0
      actual = @linear.ev(@xs)
      assert_equal(expected, actual)
    end

    def test_cov_with_diff_length_xs_and_ys_should_be_raise
      assert_raise RuntimeError do 
        @linear.cov(@xs, @ys[1..@ys.length])
      end
    end

    def test_cov_with_xs_and_ys_should_be_equal_to_expected
      expected = 196.50
      actual = @linear.cov(@xs, @ys)

      assert_in_delta(expected, actual, 0.000001)
    end

    def test_stdev_with_nil_should_be_raise
      assert_raise RuntimeError do
        @linear.stdev(nil)
      end
    end

    def test_stdev_with_xs_should_be_equal_to_expected
      expected = 15.0
      actual = @linear.stdev(@xs)
      assert_equal(expected, actual)
    end

    def test_pcc_with_diff_length_xs_ys_should_be_raise
      assert_raise RuntimeError do 
        @linear.pcc(@xs, @ys[1..@ys.length])
      end
    end

    def test_pcc_with_xs_and_ys_should_be_equal_to_expected
      expected = 0.830362
      actual = @linear.pcc(@xs, @ys)
      assert_in_delta(expected, actual, 0.000001)
    end

    def test_slope
      expected =  0.87333
      actual = @linear.slope(@xs, @ys)
      assert_in_delta(expected, actual, 0.00001)
    end

    def test_intercept
      expected = -81.93333
      actual = @linear.intercept(@xs, @ys)
      assert_in_delta(expected, actual, 0.00001)
    end
  end
end
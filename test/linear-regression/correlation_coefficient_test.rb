require "linear-regression"
require "test/unit"

module Regression
  class CorrelationCoefficientTests < Test::Unit::TestCase 
    def setup
      @xs = [150, 160, 170, 180, 190, 200, 190, 180, 170, 160]
      @ys = [51, 63, 68, 79, 90, 97, 88, 50, 63, 60]

      @corelation = CorrelationCoefficient.new(@xs, @ys)
    end

    def test_pearson_with_diff_length_xs_ys_should_be_raise
       assert_raise RuntimeError do 
         CorrelationCoefficient.new(@xs, @ys.drop(1))
       end
    end

    def test_pearson_with_xs_and_ys_should_be_equal_to_expected
      expected = 0.830362
      actual = @corelation.pearson
      assert_in_delta(expected, actual, 0.000001)
    end
  end
end
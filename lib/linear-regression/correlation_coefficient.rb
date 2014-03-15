module Regression
  class CorrelationCoefficient < Base
    def initialize(xs, ys)
      raise "Length xs and ys must be equal" unless xs.length == ys.length

      @xs = xs
      @ys = ys
    end


    # Pearson product-moment correlation coefficient
    # http://en.wikipedia.org/wiki/Pearson_product-moment_correlation_coefficient
    def pearson
      @pearson ||= covariance(@xs, @ys) / (standard_deviation(@xs).to_f * standard_deviation(@ys).to_f)
    end

    # Spearman's rank correlation coefficient
    # http://en.wikipedia.org/wiki/Spearman%27s_rank_correlation_coefficient
    def spearman
      @spearman ||= calc_spearman
    end

    private 
    def calc_spearman
      len, sum = xs.length, 0.0
      
      sum = xs.zip(ys)
        .map{|x, y| (x - y) ** 2}
        .inject(0.0) {|sum, x| sum += x}

      1 - (6 * sum)/(len * (len - 1))
    end
  end
end
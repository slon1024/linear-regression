module Regression
  class Linear
    # Expected value
    # http://en.wikipedia.org/wiki/Expected_value
    def ev(items)
      raise "Items must be an array" unless items.is_a?(Array)

      items.inject(0) {|sum, x| sum + x}.to_f / items.length
    end

    # Covariance
    # http://en.wikipedia.org/wiki/Covariance
    def cov2(xs, ys)
      raise "Length xs and ys must be equal" unless xs.length == ys.length

      xys = xs.zip(ys).map{|x,y| x*y}
      ev(xys) - ev(xs)*ev(ys)
    end

    # Another way to implement covariance
    def cov(xs, ys)
      raise "Length xs and ys must be equal" unless xs.length == ys.length

      ev_x, ev_y = ev(xs), ev(ys)
      xs.zip(ys)
        .map{|x,y| (x-ev_x) * (y-ev_y)}
        .inject(0) {|sum, x| sum += x} / xs.length
    end


    # Variance
    # http://en.wikipedia.org/wiki/Variance
    def var(items)
      raise "Items must be an array" unless items.is_a?(Array)

      ev(items.map{|i| i**2}) - ev(items)**2
    end

    # Standard Deviation
    # http://en.wikipedia.org/wiki/Standard_deviation
    def stdev(items)
      raise "Items must be an array" unless items.is_a?(Array)

      Math.sqrt(var(items))
    end

    # Pearson product-moment correlation coefficient
    # http://en.wikipedia.org/wiki/Pearson_product-moment_correlation_coefficient
    def pcc(xs, ys)
      raise "Length xs and ys must be equal" unless xs.length == ys.length

      cov(xs, ys) / (stdev(xs).to_f * stdev(ys).to_f)
    end

    # Spearman's rank correlation coefficient
    # http://en.wikipedia.org/wiki/Spearman%27s_rank_correlation_coefficient
    def scc(xs, ys)
      raise "Length xs and ys must be equal" unless xs.length == ys.length
      
      len, sum = xs.length, 0.0
      
      sum = xs.zip(ys)
        .map{|x, y| (x - y) ** 2}
        .inject(0.0) {|sum, x| sum += x}

      1 - (6 * sum)/(len * (len - 1))
    end

    # y = kx + b
    def slope(xs, ys)
      raise "Length xs and ys must be equal" unless xs.length == ys.length

      cov(xs, ys) / var(xs)   
    end

    # y = kx + b
    def intercept(xs, ys)
      ev(ys) - slope(xs, ys) * ev(xs)
    end
  end
end

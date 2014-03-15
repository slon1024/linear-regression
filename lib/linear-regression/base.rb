module Regression
  class Base 
    # Expected value
    # http://en.wikipedia.org/wiki/mean
    def mean(values)
      raise "values must be an array" unless values.is_a?(Array)

      values.inject(0) {|sum, x| sum + x}.to_f / values.length
    end

    # Covariance
    # http://en.wikipedia.org/wiki/Covariance
    def covariance(xs, ys)
      raise "Length xs and ys must be equal" unless xs.length == ys.length

      xys = xs.zip(ys).map{|x,y| x * y }
      mean(xys) - mean(xs) * mean(ys)
    end

    # Another way to implement covariance
    def covariance2(xs, ys)
      raise "Length xs and ys must be equal" unless xs.length == ys.length

      ev_x, ev_y = mean(xs), mean(ys)
      xs.zip(ys)
        .map{|x,y| (x-ev_x) * (y-ev_y)}
        .inject(0) {|sum, x| sum += x} / xs.length
    end

    # Variance
    # http://en.wikipedia.org/wiki/Variance
    def variance(values)
      raise "Values must be an array" unless values.is_a?(Array)

      mean(values.map{|i| i**2}) - mean(values)**2
    end

    # Standard Deviation
    # http://en.wikipedia.org/wiki/Standard_deviation
    def standard_deviation(values)
      raise "Values must be an array" unless values.is_a?(Array)

      Math.sqrt(variance(values))
    end
  end
end
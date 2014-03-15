 module Regression 
  class Linear < Base
    def initialize(xs, ys)
      raise "xs must be an array" unless xs.is_a?(Array)
      raise "ys must be an array" unless ys.is_a?(Array)
      raise "Length xs and ys must be equal" unless xs.length == ys.length

      @xs = xs
      @ys = ys
    end

    def trend(values)
      values.map{|x| predict x}
    end

    # y = kx + b
    def predict(x)
       slope * x + intercept
    end

    # it's k (in y = kx + b)
    def slope
      @slope ||= covariance(@xs, @ys) / variance(@xs)   
    end

    # it's b (in y = kx + b)
    def intercept
      @intercept ||= mean(@ys) - slope * mean(@xs)
    end
  end
end
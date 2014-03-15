 module Regression 
  class Linear < Base
    def initialize(xs, ys)
      abort "Length xs and ys must be equal" unless xs.length == ys.length

      @xs = xs
      @ys = ys
    end

    def trend
      @xs.map{|x| predict x}
    end

    def predict(x)
       y = slope * x + intercept
    end

    # y = kx + b
    def slope
      @slope ||= cov(@xs, @ys) / var(@xs)   
    end

    # y = kx + b
    def intercept
      @intercept ||= ev(@ys) - slope * ev(@xs)
    end
  end
end
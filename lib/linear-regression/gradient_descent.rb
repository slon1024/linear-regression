module LinearRegression
  class GradientDescent

    def initialize(xs, ys)
      @xs = xs.map { |row| [1] + row }.freeze
      @ys = ys.freeze
      
      @thetas = [0.0] * ( @xs[0].length )

      puts cost_function == 32.072733877455654 
      puts gradient_descent.to_s == "[-3.63029143940436, 1.166362350335582]"
    end

    def cost_function
      squared_error.to_f / (2  * @xs.length)
    end

    # thetas - (alpha/m) * [X' * ( X*thetas - y )]
    def gradient_descent(alpha=0.01, num_iters=1500)
      m = @xs.length
      alpha_m = (alpha / m)

      (num_iters).times do

        @thetas = 
          @xs.map do |x_row|
            x_row.zip(@thetas).map do |x, theta|
             x * theta
            end.inject(:+)
          end.zip(@ys).map do |(predict_val, y)|  
            predict_val - y 
          end.zip(@xs).map do |(y, x_row)|
            x_row.map { |x| x * y }
          end.reduce([0.0] * 2) do |sum, val|
            sum.zip(val).map { |(a, b)| a + b}
          end.map do |value|
            alpha_m * value
          end.zip( @thetas ).map do |(a, b)|
            b - a
          end
      end

      @thetas
    end

    private

    def squared_error
      @xs.map do |x_row|
        x_row.zip(@thetas).map do |(x, theta)|
          x * theta
        end .inject(:+)
      end.zip(@ys).map do |(predict_val, y)| 
       (predict_val - y) ** 2 
      end.inject(:+)
    end

    
  end
end

xs, ys = [], []
File.open('ex1data1.txt').each do |line|
  begin 
    values = line.split(',')

    y = values.pop.to_f
    x_row = values.map { |value| value.to_f }

    xs << x_row
    ys << y
  rescue TypeError
  end
end

LinearRegression::GradientDescent.new(xs, ys)

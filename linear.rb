module Regression
    class Linear
        # Expected value
        # http://en.wikipedia.org/wiki/Expected_value
        def ev(items)
            raise "Items must be an array" unless items.is_a?(Array)

            sum = 0
            items.each do |item|
                sum += item
            end
            sum.to_f / items.length
        end

        # Covariance
        # http://en.wikipedia.org/wiki/Covariance
        def cov(xs, ys)
            raise "Length xs and ys must be equal" unless xs.length == ys.length

            xys = (0..(xs.length-1)).map{|i| xs[i] * ys[i]}
            ev(xys) - ev(xs)*ev(ys)
        end

        # Another way to implement covariance
        def cov2(xs, ys)
            raise "Length xs and ys must be equal" unless xs.length == ys.length

            len = xs.length
            sum = 0 
            ev_x = ev(xs)
            ev_y = ev(ys)

            0.upto(len - 1) do |i|
               sum += (xs[i].to_f - ev_x) * (ys[i].to_f - ev_y)
            end
            sum / len
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

        # y = kx + b
        def k(xs, ys)
            raise "Length xs and ys must be equal" unless xs.length == ys.length

            cov(xs, ys) / var(xs)   
        end

        # y = kx + b
        def b(xs, ys)
            ev(ys) - k(xs, ys) * ev(xs)
        end
    end
end
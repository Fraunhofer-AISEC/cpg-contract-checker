def rational_poisson(lmbda)
  Hash.new.tap do |h|   # create a hash and pass it to this block as 'h'.
    # Make all components of the calculations rational to allow
    # cancellations to occur wherever possible when dividing
    e_to_minus_lambda = Math.exp(-lmbda).to_r
    factorial = 1r
    lmbda = lmbda.to_r
    power = 1r
    (0...).each do |x|
      unless x == 0
        power *= lmbda
        factorial *= x
      end
      value = (e_to_minus_lambda / factorial) * power
      # the following double inversion/conversion bounds the result
      # by the significant bits in the mantissa of a float
      approx = Rational(1, (1 / value).to_f)
      h[x] = approx
      break if x > lmbda && approx.numerator <= 1
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  lmbda = (ARGV.shift || 2.0).to_f  # read in a lambda (defaults to 2.0)
  pmf = rational_poisson(lmbda)     # create the pmf for a Poisson with that lambda
  pmf.each { |key, value| puts "p(#{key}) = #{value} = #{value.to_f}" }
  puts "cumulative error = #{1.0 - pmf.values.inject(&:+)}"  # does it sum to 1?
end

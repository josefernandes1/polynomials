class Polynomial
  attr_reader :coefficients

  def initialize(*coefficients)
    # find highest significant factor position
    highest_significant_factor = coefficients.length - 1
    (coefficients.length - 1).downto(1) do |pos|
      break if coefficients[pos] != 0
      highest_significant_factor = pos - 1
    end

    @coefficients = coefficients[0..highest_significant_factor]
  end

  def ==(other)
    other.coefficients == coefficients
  end

  def derivative
    Polynomial.new(*(1..(coefficients.length - 1)).map { |i| coefficients[i] * i })
  end

  def to_s
    ((coefficients.length - 1).downto(0)).map do |i|
      next if coefficients[i] == 0

      is_highest_exponent_element = i == (coefficients.length - 1)
      is_positive_coefficient = coefficients[i] > 0
      signal_prefix = !is_highest_exponent_element && is_positive_coefficient ? '+' : ''
      factor = (coefficients[i] == 1 && i > 0 ? '' : coefficients[i])
      exponent = i > 1 ? "^#{i}" : ''
      variable = i > 0 ? 'x' : ''

      "#{signal_prefix}#{factor}#{variable}#{exponent}"
    end.compact.join
  end
end

class PolynomialsController < ApplicationController
  def derivative
    derivative = Polynomial.new(*coefficients).derivative
    render plain: derivative.to_s
  end

  private

  def coefficients
    params[:coefficients].split('/').reject(&:blank?).map(&:to_i).reverse
  end
end

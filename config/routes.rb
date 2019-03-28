Rails.application.routes.draw do
  get '/differentiate/*coefficients' => 'polynomials#derivative'
end

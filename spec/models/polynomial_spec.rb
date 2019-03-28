require 'rails_helper'

describe Polynomial do
  describe '==' do
    it 'returns whether the coefficients are equal' do
      aggregate_failures do
        expect(Polynomial.new(1, 2, 3)).to eq Polynomial.new(1, 2, 3)
        expect(Polynomial.new(1, 2, 3)).not_to eq Polynomial.new(1, 1, 3)
      end
    end

    it 'ignores non-significant coefficients' do
      expect(Polynomial.new(1, 2, 0)).to eq Polynomial.new(1, 2)
    end
  end

  describe 'derivative' do
    it 'returns the derivative polynomial' do
      expect(Polynomial.new(1, 2, 3).derivative).to eq Polynomial.new(2, 6)
    end

    it 'handles negative coefficients' do
      expect(Polynomial.new(1, 0, -5, 4).derivative).to eq Polynomial.new(0, -10, 12)
    end
  end

  describe 'to_s' do
    it 'represents polynomial in the form k(n)x^n + ... + k(1)x + k(0)' do
      expect(Polynomial.new(1, 2, 3, 4).to_s).to eq '4x^3+3x^2+2x+1'
    end

    it 'omits zero coefficient terms' do
      expect(Polynomial.new(0, 0, 2).to_s).to eq '2x^2'
    end

    it 'renders minus sign on highest exponent term' do
      expect(Polynomial.new(1, 2, 3, -4).to_s).to eq '-4x^3+3x^2+2x+1'
    end

    it 'renders minus sign on other exponents' do
      expect(Polynomial.new(1, 2, -3, 4).to_s).to eq '4x^3-3x^2+2x+1'
    end

    it 'discards non-significant coefficients' do
      expect(Polynomial.new(1, 0, 0).to_s).to eq '1'
    end

    it 'omits 1 in 1x^n' do
      expect(Polynomial.new(1, 1, 1).to_s).to eq 'x^2+x+1'
    end
  end
end

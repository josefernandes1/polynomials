require 'rails_helper'

describe PolynomialsController, type: :controller do
  describe 'GET derivative' do
    it 'renders a string representation of derivative of polynomial with given terms' do
      # makes sure the Polynomial#derivative is called with correct arguments
      expect(Polynomial).to receive(:new).with(1, 0, 3, 4).and_call_original
      expect(Polynomial).to receive(:new).with(0, 6, 12).and_call_original
      expect_any_instance_of(Polynomial).to receive(:derivative).and_call_original

      get :derivative, params: { coefficients: '/4/3/0/1' }
      expect(response.body).to eq '12x^2+6x'
    end
  end
end

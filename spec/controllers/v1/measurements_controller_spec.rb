require 'rails_helper'

RSpec.describe V1::MeasurementsController, type: :controller do
  describe 'POST :create' do
    it 'should return 202 Accepted' do
      post :create, params: {}

      expect(response).to be_accepted
    end
  end
end

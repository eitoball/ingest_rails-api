require 'rails_helper'

RSpec.describe V1::MeasurementsController, type: :controller do
  describe 'POST :create' do
    before do
      ActiveJob::Base.queue_adapter = :test
    end

    it 'should return 202 Accepted' do
      device_id = 1_553_490_618
      post :create, body: file_fixture("#{device_id}.txt").read

      expect(response).to be_accepted
      expect(SolarcastPayload).to be_exist
      expect(ImportSolarcastPayloadsJob).to have_been_enqueued
    end
  end
end

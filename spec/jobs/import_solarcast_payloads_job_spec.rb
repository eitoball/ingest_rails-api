require 'rails_helper'

RSpec.describe ImportSolarcastPayloadsJob, type: :job do
  describe '#perform' do
    it 'should import to measurements' do
      device_id = 1_553_490_618
      payload = SolarcastPayload.create!(payload: file_fixture("#{device_id}.txt").read)
      described_class.perform_now(payload)

      expect(Measurement).to be_exist
    end
  end
end

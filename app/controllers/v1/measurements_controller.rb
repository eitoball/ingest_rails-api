class V1::MeasurementsController < ApplicationController
  def create
    payload = SolarcastPayload.create!(payload: request.body.read)
    ImportSolarcastPayloadsJob.perform_later(payload)
    head :accepted
  end
end

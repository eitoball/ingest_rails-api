class V1::MeasurementsController < ApplicationController
  def create
    SolarcastPayload.create!(payload: request.body.read)
    head :accepted
  end
end

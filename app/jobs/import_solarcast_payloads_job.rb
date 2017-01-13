class ImportSolarcastPayloadsJob < ApplicationJob
  def perform(*payloads)
    each_payload(*payloads) do |json|
      Measurement.create!(measurement_attributes(json))
    end
  end

  private

  def each_payload(*payloads)
    payloads.each do |payload|
      StringIO.new(payload.payload).each_line.lazy
        .map(&:chomp)
        .reject(&:blank?)
        .each do |json|
          yield(json)
        end
    end
  end

  def measurement_attributes(payload)
    decoded = JSON.parse(payload)
    {
      captured_at: Time.parse(decoded['captured_at']),
      location: format('POINT(%s %s)', decoded['longitude'], decoded['latitude']),
      device_id: decoded['device_id'],
      payload: payload
    }
  end
end

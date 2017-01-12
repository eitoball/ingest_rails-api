class CreateSolarcastPayloads < ActiveRecord::Migration[5.0]
  def change
    create_table :solarcast_payloads do |t|
      t.binary :payload, null: false

      t.timestamps
    end
  end
end

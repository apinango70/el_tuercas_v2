class CreateVehicleServices < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_services do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end

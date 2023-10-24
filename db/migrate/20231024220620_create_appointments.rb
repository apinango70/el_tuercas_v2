class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end

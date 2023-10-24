class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :service_name
      t.string :spare_parts
      t.date :deadline
      t.string :status
      t.integer :vehicle_id

      t.timestamps
    end
  end
end

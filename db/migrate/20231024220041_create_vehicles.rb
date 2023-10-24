class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :model
      t.string :plate_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

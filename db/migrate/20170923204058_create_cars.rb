class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :licensePlateNumber, null: false
      t.string :manufacturer
      t.string :model
      t.float :hourlyRentalRate
      t.string :style
      t.string :location
      t.string :status

      t.timestamps
    end
    add_index :cars, :licensePlateNumber, unique: true
  end
end

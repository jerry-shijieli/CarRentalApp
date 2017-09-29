class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.timestamp :checkOutTime, null: false
      t.timestamp :pickUpTime, null: true
      t.timestamp :expectedReturnTime, null: false
      t.timestamp :returnTime, null: true
      t.string :reservationStatus, default: "Awaiting"

      t.references :user
      t.references :car
      t.timestamps
    end
  end
end

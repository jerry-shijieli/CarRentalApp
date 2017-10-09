class CreateWaitinglists < ActiveRecord::Migration[5.1]
  def change
    create_table :waitinglists do |t|
      t.string :status
      
      t.references :car
      t.references :user
      t.timestamps
    end
  end
end

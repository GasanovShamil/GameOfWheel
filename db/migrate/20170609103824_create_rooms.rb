class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :winner
      t.date :created_at
      t.integer :created_by
      t.date :start_date
      t.date :end_date
      
      t.timestamps
    end
  end
end
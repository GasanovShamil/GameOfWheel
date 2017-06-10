class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :prize
      t.references :winner
      t.date :created_at
      t.references :created_by
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
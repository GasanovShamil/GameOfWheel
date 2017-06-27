class CreatePrizes < ActiveRecord::Migration[5.0]
  def change
    create_table :prizes do |t|
   	  t.string :name
      t.string :description
      t.string :photo_path
      t.float :price
      
      t.timestamps
    end

    add_reference :rooms, :prize, foreign_key: true
  end
end

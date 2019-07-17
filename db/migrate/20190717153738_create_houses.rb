class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :style
      t.string :color
      t.integer :owner_id

    end 
  end
end

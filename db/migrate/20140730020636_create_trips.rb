class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :trip_name
      t.string :location
      t.string :date
      t.integer :user_id
      t.text :to_pack
      t.text :to_do
      t.integer :budget
      t.text :things_i_did
      t.text :things_i_liked
      t.text :things_i_didnt_like

      t.timestamps
    end
  end
end

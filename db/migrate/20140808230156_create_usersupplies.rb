class CreateUsersupplies < ActiveRecord::Migration
  def change
    create_table :usersupplies do |t|
      t.references :user_id, index: true
      t.references :supply_id, index: true

      t.timestamps
    end
  end
end

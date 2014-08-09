class CreateTripSupplies < ActiveRecord::Migration
  def change
    create_table :trip_supplies do |t|
      t.references :trip, index: true
      t.references :supply, index: true

      t.timestamps
    end
  end
end

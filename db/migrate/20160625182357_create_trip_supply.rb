class CreateTripSupply < ActiveRecord::Migration
  def change
    create_table :trip_supplies do |t|
      t.integer :trip_id
      t.integer :supply_id
    end
  end
end

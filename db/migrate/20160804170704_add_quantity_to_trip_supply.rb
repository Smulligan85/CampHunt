class AddQuantityToTripSupply < ActiveRecord::Migration
  def change
    add_column :trip_supplies, :quantity, :integer, :default => 1
  end
end

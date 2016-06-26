class RemoveTripIdFromSupplies < ActiveRecord::Migration
  def change
    remove_column :supplies, :trip_id, :integer
  end
end

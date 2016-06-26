class RemoveQuantityFromSupplies < ActiveRecord::Migration
  def change
    remove_column :supplies, :quantity, :integer
  end
end

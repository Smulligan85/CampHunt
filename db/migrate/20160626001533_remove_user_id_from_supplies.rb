class RemoveUserIdFromSupplies < ActiveRecord::Migration
  def change
    remove_column :supplies, :user_id, :integer
  end
end

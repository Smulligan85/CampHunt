class AddUserToSupplies < ActiveRecord::Migration
  def change
    add_reference :supplies, :user, index: true, foreign_key: true
  end
end

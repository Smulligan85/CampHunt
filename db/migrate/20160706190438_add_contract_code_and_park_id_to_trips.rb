class AddContractCodeAndParkIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :contract_code, :string
    add_column :trips, :park_id, :integer
  end
end

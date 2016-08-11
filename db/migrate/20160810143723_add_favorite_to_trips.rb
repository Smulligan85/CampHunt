class AddFavoriteToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :favorite, :boolean, default: false
  end
end

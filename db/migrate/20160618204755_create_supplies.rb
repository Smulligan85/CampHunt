class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.references :trip, index: true, foreign_key: true
      t.string :name
      t.integer :quantity

      t.timestamps null: false
    end
  end
end

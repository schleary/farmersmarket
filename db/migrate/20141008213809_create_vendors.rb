class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.integer :employees
      t.integer :market_id

      t.timestamps
    end
  end
end

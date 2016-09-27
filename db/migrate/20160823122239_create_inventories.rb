class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :total_quantity
      t.integer :remaining_quantity

      t.references :pharmacy, index: true
      t.references :drug, index: true

      t.timestamps null: false
    end
  end
end

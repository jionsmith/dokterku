class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :code
      t.string :type

      t.references :pharmacy, index: true

      t.timestamps null: false
    end
  end
end

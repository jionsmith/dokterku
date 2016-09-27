class CreatePharmacies < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.string :business_name

      t.references :institution, index: true

      t.timestamps null: false
    end
  end
end

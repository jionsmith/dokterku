class RenamePharmaciesTableToSuppliers < ActiveRecord::Migration
  def change
    rename_table :pharmacies, :suppliers
  end
end

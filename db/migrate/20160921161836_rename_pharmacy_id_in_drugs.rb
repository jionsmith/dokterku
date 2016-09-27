class RenamePharmacyIdInDrugs < ActiveRecord::Migration
  def change
    rename_column :drugs, :pharmacy_id, :supplier_id
  end
end

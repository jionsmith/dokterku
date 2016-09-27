class RemoveInstitutionIdFromSuppliers < ActiveRecord::Migration
  def change
    remove_column :suppliers, :institution_id
  end
end

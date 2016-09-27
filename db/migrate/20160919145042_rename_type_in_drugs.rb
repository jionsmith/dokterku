class RenameTypeInDrugs < ActiveRecord::Migration
  def change
    rename_column :drugs, :type, :type_drug
  end
end

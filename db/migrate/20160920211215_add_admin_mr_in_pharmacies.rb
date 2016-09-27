class AddAdminMrInPharmacies < ActiveRecord::Migration
  def change
    add_column :pharmacies, :admin_mr, :string
  end
end

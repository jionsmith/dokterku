class AddDetailsInPharmacy < ActiveRecord::Migration
  def change
    change_table :pharmacies do |t|
      t.string :supplier_code
      t.string :company_name
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :country
      t.string :rt_rw
      t.string :district
      t.string :kelurahan
      t.string :city
      t.string :province
      t.string :zip_code
    end
  end
end

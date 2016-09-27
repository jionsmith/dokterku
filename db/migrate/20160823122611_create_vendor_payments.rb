class CreateVendorPayments < ActiveRecord::Migration
  def change
    create_table :vendor_payments do |t|

      t.timestamps null: false
    end
  end
end

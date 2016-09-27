class AddSuplierPriceInDrug < ActiveRecord::Migration
  def change
    add_column :drugs, :supplier_price, :decimal
  end
end

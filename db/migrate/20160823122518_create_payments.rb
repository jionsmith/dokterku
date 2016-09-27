class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount_paid
      t.decimal :balance
      t.string :method

      t.references :billing, index: true

      t.timestamps null: false
    end
  end
end

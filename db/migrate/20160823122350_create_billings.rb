class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.references :user, index: true
      t.references :institution, index: true
      t.references :visit_note, index: true

      t.timestamps null: false
    end
  end
end

class CreateNurses < ActiveRecord::Migration
  def change
    create_table :nurses do |t|
      t.string :phone_number
      t.string :blood_type
      t.float :height
      t.float :weight
      t.belongs_to :user, index: true
      t.references :hospital, index: true

      t.timestamps null: false
    end
  end
end

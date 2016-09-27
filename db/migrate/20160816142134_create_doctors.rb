class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :speciality
      t.time :hours_from
      t.time :hours_to
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

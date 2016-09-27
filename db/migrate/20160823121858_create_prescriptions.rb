class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :dosage
      t.string :quantity
      t.string :refills
      t.date :start_date
      t.date :end_date

      t.references :user, index: true
      t.references :doctor, index: true
      t.references :drug, index: true

      t.timestamps null: false
    end
  end
end

class CreateVisitMedicines < ActiveRecord::Migration
  def change
    create_table :visit_medicines do |t|
      t.string :name
      t.string :type_of_drugs
      t.string :dosage
      t.string :qty
      t.date :start_date
      t.date :end_date
      t.references :visit_note, index: true
    end
  end
end

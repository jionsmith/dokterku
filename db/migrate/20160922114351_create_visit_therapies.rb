class CreateVisitTherapies < ActiveRecord::Migration
  def change
    create_table :visit_therapies do |t|
      t.string :injection
      t.string :infusion
      t.string :transfusion
      t.string :oral
      t.references :visit_note, index: true
    end
  end
end

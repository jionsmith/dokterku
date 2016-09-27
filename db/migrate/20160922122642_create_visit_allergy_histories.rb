class CreateVisitAllergyHistories < ActiveRecord::Migration
  def change
    create_table :visit_allergy_histories do |t|
      t.string :substance
      t.string :reaction
      t.references :visit_note, index: true
    end
  end
end

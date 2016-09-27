class AddDetailsInVisitDiagnostics < ActiveRecord::Migration
  def change
    change_table :visit_diagnostics do |t|
      t.string :initial_diagnosis
      t.string :differential_diagnosis
      t.string :final_diagnosis
      t.string :diagnosis_of_complications
      t.string :second_diagnosis
      t.references :visit_note, index: true
    end
  end
end

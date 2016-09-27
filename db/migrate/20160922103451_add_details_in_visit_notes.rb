class AddDetailsInVisitNotes < ActiveRecord::Migration
  def change
    change_table :visit_notes do |t|
      t.string :reason
      t.string :symptoms
      t.string :medical_history
      t.string :awareness
      t.integer :pulse
      t.string :respiratory
      t.string :temperature
      t.string :blood_pressure
      t.string :head
      t.string :eye
      t.string :multi
      t.string :tooth
      t.string :throat
      t.string :neck
      t.string :chest
      t.string :quality_heart
      t.string :lungs
      t.string :liver
      t.string :lien
      t.string :kidneys
      t.string :stomach
      t.string :contents
      t.string :genitals
      t.string :height
      t.string :weight
      t.string :bmi
      t.string :bp
      t.references :institution, index: true
    end
  end
end

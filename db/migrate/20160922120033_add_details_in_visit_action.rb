class AddDetailsInVisitAction < ActiveRecord::Migration
  def change
    change_table :visit_actions do |t|
      t.string :therapeutic_action
      t.string :diagnosis_action
      t.string :medical_actions
    end
  end
end

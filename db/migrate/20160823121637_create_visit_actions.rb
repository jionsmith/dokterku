class CreateVisitActions < ActiveRecord::Migration
  def change
    create_table :visit_actions do |t|
      t.text :action
      t.decimal :amount_owed

      t.references :visit_note, index: true
      t.references :doctor, index: true

      t.timestamps null: false
    end
  end
end

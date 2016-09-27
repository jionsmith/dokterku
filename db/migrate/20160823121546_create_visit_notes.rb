class CreateVisitNotes < ActiveRecord::Migration
  def change
    create_table :visit_notes do |t|
      t.string :visit_type

      t.references :user, index: true

      t.timestamps null: false
    end
  end
end

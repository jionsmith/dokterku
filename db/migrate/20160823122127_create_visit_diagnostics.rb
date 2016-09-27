class CreateVisitDiagnostics < ActiveRecord::Migration
  def change
    create_table :visit_diagnostics do |t|

      t.timestamps null: false
    end
  end
end

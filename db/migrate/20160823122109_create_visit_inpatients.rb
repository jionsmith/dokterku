class CreateVisitInpatients < ActiveRecord::Migration
  def change
    create_table :visit_inpatients do |t|

      t.timestamps null: false
    end
  end
end

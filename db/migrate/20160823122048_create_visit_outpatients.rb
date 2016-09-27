class CreateVisitOutpatients < ActiveRecord::Migration
  def change
    create_table :visit_outpatients do |t|

      t.timestamps null: false
    end
  end
end

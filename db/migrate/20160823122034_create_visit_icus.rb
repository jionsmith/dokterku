class CreateVisitIcus < ActiveRecord::Migration
  def change
    create_table :visit_icus do |t|

      t.timestamps null: false
    end
  end
end

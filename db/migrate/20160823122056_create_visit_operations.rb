class CreateVisitOperations < ActiveRecord::Migration
  def change
    create_table :visit_operations do |t|

      t.timestamps null: false
    end
  end
end

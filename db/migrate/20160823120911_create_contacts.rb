class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :data
      t.string :type
      t.boolean :disabled

      t.timestamps null: false
    end
  end
end

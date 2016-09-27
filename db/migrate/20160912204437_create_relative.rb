class CreateRelative < ActiveRecord::Migration
  def change
    create_table :relatives do |t|
      t.references :user, index: true
      t.string :relative_id
      t.string :relative_type
    end
  end
end

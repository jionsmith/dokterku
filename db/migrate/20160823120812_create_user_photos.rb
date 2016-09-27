class CreateUserPhotos < ActiveRecord::Migration
  def change
    create_table :user_photos do |t|
      t.string :path
      t.string :ip

      t.references :user, index: true

      t.timestamps null: false
    end
  end
end

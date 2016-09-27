class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :ip
      t.string :device_type
      t.string :device_token

      t.references :user, index: true

      t.timestamps null: false
    end
  end
end

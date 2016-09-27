class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Basic information
      t.string :rm_number
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :salutation
      t.string :gender
      t.date :date_of_birth
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email

      ## Disable
      t.boolean :disabled, default: false

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end

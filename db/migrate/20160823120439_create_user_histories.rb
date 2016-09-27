class CreateUserHistories < ActiveRecord::Migration
  def change
    create_table :user_histories do |t|
      ## Database authenticatable
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Basic information
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

      t.references :user, index: true

      t.timestamps null: false
    end
  end
end

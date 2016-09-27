class AddAdditionalFieldsInUser < ActiveRecord::Migration
  def change
    add_column :users, :id_type, :string
    add_column :users, :home_phone, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :place_of_birth, :string
    add_column :users, :blood_type, :string
  end
end

class AddPersonDetailsInUser < ActiveRecord::Migration
  def change
    add_column :users, :desa, :string
    add_column :users, :kecamatan, :string
    add_column :users, :rt_rw, :string
    add_column :users, :kabupaten, :string
    add_column :users, :kelurahan, :string
    add_column :users, :provinsi, :string
    add_column :users, :education, :string
    add_column :users, :religion, :string
    add_column :users, :nationality, :string
    add_column :users, :marital_status, :string
    add_column :users, :occupation, :string
    add_column :users, :company, :string
    add_column :users, :full_address, :string
    add_column :users, :phone, :string
  end
end

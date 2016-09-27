class AddDetailsInInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :director_rm, :string
    add_column :institutions, :inst_type, :string
    add_column :institutions, :verification_number, :string
    add_column :institutions, :phone, :string
  end
end

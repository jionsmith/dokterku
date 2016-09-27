class AddNamaRumahSakitInInstitutions < ActiveRecord::Migration
  def change
    add_column :institutions, :nama_rumah_sakit, :string
  end
end

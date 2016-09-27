class CreateInstitutionsUsers < ActiveRecord::Migration
  def change
    create_table :institutions_users do |t|
      t.integer :institution_id
      t.integer :user_id
    end
  end
end

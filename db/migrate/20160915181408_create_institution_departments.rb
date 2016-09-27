class CreateInstitutionDepartments < ActiveRecord::Migration
  def change
    create_table :institution_departments do |t|
      t.references :institution, index: true
      t.references :department, index: true
    end
  end
end

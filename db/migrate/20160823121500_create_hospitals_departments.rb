class CreateHospitalsDepartments < ActiveRecord::Migration
  def change
    create_table :hospitals_departments do |t|
      t.integer :hospital_id
      t.integer :department_id
    end
  end
end

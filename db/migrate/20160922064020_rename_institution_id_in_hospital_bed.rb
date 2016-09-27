class RenameInstitutionIdInHospitalBed < ActiveRecord::Migration
  def change
    rename_column :beds, :institution_id, :hospital_id
  end
end

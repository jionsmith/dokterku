class InstitutionDepartment < ActiveRecord::Base

  belongs_to :institution
  belongs_to :department

end
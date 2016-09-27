class SuppliersInstitution < ActiveRecord::Base

  belongs_to :supplier
  belongs_to :institution

end
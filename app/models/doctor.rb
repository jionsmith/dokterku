class Doctor < ActiveRecord::Base
  belongs_to :user
  has_many :prescriptions
end

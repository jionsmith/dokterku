class Prescription < ActiveRecord::Base
  belongs_to :user
  belongs_to :doctor
  belongs_to :drug
end

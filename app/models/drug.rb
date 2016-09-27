class Drug < ActiveRecord::Base
  has_many :prescriptions
  belongs_to :pharmacy
  has_many :inventories
end

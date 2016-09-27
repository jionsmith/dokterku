class Billing < ActiveRecord::Base
  belongs_to :user
  belongs_to :institution
  belongs_to :visit_note
  has_many :payments
end

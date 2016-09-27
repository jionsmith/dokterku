class VisitNote < ActiveRecord::Base
  belongs_to :user
  has_many :visit_actions
  has_many :billings
  has_one :visit_diagnostic
  has_many :visit_therapies
  has_many :visit_allergy_histories
  has_many :visit_medicines

end

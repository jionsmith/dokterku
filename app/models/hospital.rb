class Hospital < ActiveRecord::Base

  belongs_to :institution
  has_many :hospitals_departments
  has_many :visit_notes
  has_one :bed

  validates :name, presence: true

  def country_name
    c = ISO3166::Country[country]
    c.name || c.translations[I18n.locale.to_s]
  end
end

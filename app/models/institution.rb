class Institution < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :suppliers_institutions
  has_one :hospital
  has_many :billings
  has_many :institution_departments


  def country_name
    c = ISO3166::Country[country]
    if c.present?
      c.name || c.translations[I18n.locale.to_s]
    end
  end
end

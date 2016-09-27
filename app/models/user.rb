class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :confirmable, :rememberable, :validatable

  after_initialize :generate_rm_number, if: :new_record?
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :institutions
  has_many :user_histories
  has_many :logins
  has_many :user_photos
  has_many :visit_notes
  has_many :prescriptions
  has_many :billings
  has_many :user_allergies
  has_many :relatives
  has_many :institutions, foreign_key: 'admin_mr', primary_key: 'rm_number'
  has_many :pharmacies, :foreign_key => :admin_mr, :primary_key => :rm_number

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def full_name
    return "#{self.salutation} #{self.first_name} #{self.middle_name} #{self.last_name}"
  end

  def active_for_authentication?
    super and !self.disabled
  end

  def generate_rm_number
    self.rm_number = loop do
      l = ('A'..'Z').to_a
      l.delete('I')
      l.delete('O')
      l.delete('L')
      lt = l.shuffle[0..2].join
      n = (0..9).to_a.shuffle[0..3].join
      rm = lt + n
      break rm unless User.exists?(rm_number: rm)
    end
  end


  def country_name
    c = ISO3166::Country[country]
    if c.present?
      c.name || c.translations[I18n.locale.to_s]
    end
  end

  def admin_mr?(inst_id)
    if Institution.where(:id => inst_id, :admin_mr => self.rm_number).exists?
      true
    else
      false
    end
  end

  def get_hospitals
    data = Institution.includes(:hospital).where(:admin_mr => self.rm_number, :inst_type => 'hospital').order(:name => :asc)
    data = data.as_json(:include => :hospital)
  end

end

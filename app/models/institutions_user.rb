class InstitutionsUser < ActiveRecord::Base

  def generate_verify_number
    self.update_attribute(:verification_number, SecureRandom.base64(7))
  end

end
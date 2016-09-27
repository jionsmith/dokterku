class Users::RegistrationsController < Devise::RegistrationsController

  def after_inactive_sign_up_path_for(resource)
    set_photo_path(:id => resource)
  end


  
  private

  def sign_up_params
    # params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :middle_name, :salutation, :gender, :date_of_birth, :address_1, :address_2, :city, :state, :zip, :country)
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :middle_name, :gender, :date_of_birth, :place_of_birth, :id_type, :rm_number, :home_phone, :mobile_phone, :blood_type)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :middle_name, :salutation, :gender, :date_of_birth, :address_1, :address_2, :city, :state, :zip, :country)
  end
end

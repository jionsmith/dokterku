class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i(set_photo
                                                set_profile_details
                                                upload_photo
                                                sign_up_details
                                                add_allergies
                                                update_profile_details
                                                set_medical_histories
                                                set_relatives)

  def index
    @users = User.where.not(id: current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @user = get_user(params[:id])
  end

  def edit
    @user = get_user(params[:id])
  end

  def update
    @user = get_user(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = get_user(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def set_profile_details
    @user = User.find_by_id(params[:id])
  end

  def set_photo
    @user = User.find_by_id(params[:id])
  end

  def set_medical_histories
    @user = User.find_by_id(params[:id])
  end

  def set_relatives
    @user = User.find_by_id(params[:id])
  end

  def upload_photo
    user = User.find_by_id(params[:id])
    if user.present?
      user.update(:photo => params[:photo])
      user.update(:photo_url => user.photo.url, :photo_thumb_url => user.photo.url(:thumb))
      render json: {:status => 0, :message => 'success'}
    else
      flash[:alert] = 'We couldn\'t find a user with the specified RM number.'
      render json: {:status => 1, :message => 'user not found'}
    end
  end

  def update_profile_details
    user = get_user(params[:id])
    if user.update(user_params)
      redirect_to set_medical_histories_path, {id: user.id}
    else
      flash[:alert] = user.error.full_messages
      render 'set_profile_details'
    end
  end

  def add_allergies
    user = get_user(params[:id])
    render json: {:status => 1, :message => 'user not found'}, :status => 400 and return if user.nil?
    if params[:allergies].present?
      JSON.parse(params[:allergies]).each do |item|
        user.user_allergies.create(:substance => item['substance'], :reaction => item['reaction'])
      end
    end
    render json: {:status => 0, :message => 'success'}, :status => 200
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :middle_name, :salutation, :gender, :date_of_birth, :address_1,
                                 :address_2, :city, :state, :zip, :country, :email, :password, :desa, :kecamatan, :rt_rw, :kabupaten,
                                  :kelurahan, :provinsi, :education, :religion, :nationality, :marital_status, :occupation, :company,
                                  :full_address, :phone)
  end

  def get_user(id)
    User.find(id)
  end

end

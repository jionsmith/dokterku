class RegAdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :web_admins_initialize_data, only: [:new, :create, :edit, :update], if: :is_web_admin?

  def index
    if is_web_admin?
      @reg_admins = RegAdmin.all
    elsif is_hos_admin?
      @reg_admins = Hospital.find(current_user.hos_admin.hospital_id).reg_admins
    end
  end

  def new
    @reg_admin = User.find(params[:user_id]).build_reg_admin
  end

  def create
    @reg_admin = User.find(params[:user_id]).build_reg_admin
    if is_web_admin?
      @reg_admin.hospital_id = params[:reg_admin][:hospital_id]
    elsif is_hos_admin?
      @reg_admin.hospital_id = current_user.hos_admin.hospital_id
    end
    if @reg_admin.save
      redirect_to reg_admins_path
    else
      render 'new'
    end
  end

  def show
    if is_web_admin?
      @reg_admin = RegAdmin.find(params[:id])
    elsif is_hos_admin?
      @reg_admin = Hospital.find(current_user.hos_admin.hospital_id).reg_admins.find(params[:id])
    end
  end

  def edit
    @reg_admin = User.find(params[:user_id]).reg_admin
  end

  def update
    @reg_admin = User.find(params[:user_id]).reg_admin
    if is_web_admin?
      if @reg_admin.update(hospital_id: params[:reg_admin][:hospital_id])
        redirect_to reg_admins_path
      else
        render 'edit'
      end
    end
  end

  def destroy
    @reg_admin = User.find(params[:user_id]).reg_admin
    @reg_admin.destroy
    redirect_to reg_admins_path
  end

  private

  def web_admins_initialize_data
    @hospitals = Hospital.all
  end
end

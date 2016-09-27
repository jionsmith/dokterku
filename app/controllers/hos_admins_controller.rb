class HosAdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :web_admins_initialize_data, only: [:new, :create, :edit, :update], if: :is_web_admin?

  def index
    if is_web_admin?
      @hos_admins = HosAdmin.all
    elsif is_hos_admin?
      @hos_admins = Hospital.find(current_user.hos_admin.hospital_id).hos_admins
    end
  end

  def new
    @hos_admin = User.find(params[:user_id]).build_hos_admin
  end

  def create
    @hos_admin = User.find(params[:user_id]).build_hos_admin
    if is_web_admin?
      @hos_admin.hospital_id = params[:hos_admin][:hospital_id]
    elsif is_hos_admin?
      @hos_admin.hospital_id = current_user.hos_admin.hospital_id
    end
    if @hos_admin.save
      redirect_to hos_admins_path
    else
      render 'new'
    end
  end

  def show
    if is_web_admin?
      @hos_admin = HosAdmin.find(params[:id])
    elsif is_hos_admin?
      @hos_admin = Hospital.find(current_user.hos_admin.hospital_id).hos_admins.find(params[:id])
    end
  end

  def edit
    @hos_admin = User.find(params[:user_id]).hos_admin
  end

  def update
    @hos_admin = User.find(params[:user_id]).hos_admin
    if is_web_admin?
      if @hos_admin.update(hospital_id: params[:hos_admin][:hospital_id])
        redirect_to hos_admins_path
      else
        render 'edit'
      end
    end
  end

  def destroy
    @hos_admin = User.find(params[:user_id]).hos_admin
    @hos_admin.destroy
    redirect_to hos_admins_path
  end

  private

  def web_admins_initialize_data
    @hospitals = Hospital.all
  end
end

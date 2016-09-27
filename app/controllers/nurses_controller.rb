class NursesController < ApplicationController
  before_action :authenticate_user!
  before_action :web_admins_initialize_data, only: [:new, :create, :edit, :update], if: :is_web_admin?

  def index
    if is_web_admin?
      @nurses = Nurse.all
    elsif is_hos_admin?
      @nurses = Hospital.find(current_user.hos_admin.hospital_id).nurses
    end
  end

  def new
    @nurse = User.find(params[:user_id]).build_nurse
  end

  def create
    @nurse = User.find(params[:user_id]).build_nurse(nurse_params)
    if is_web_admin?
      @nurse.hospital_id = params[:nurse][:hospital_id]
    elsif is_hos_admin?
      @nurse.hospital_id = current_user.hos_admin.hospital_id
    end
    if @nurse.save
      redirect_to nurses_path
    else
      render 'new'
    end
  end

  def show
    if is_web_admin?
      @nurse = Nurse.find(params[:id])
    elsif is_hos_admin?
      @nurse = Hospital.find(current_user.hos_admin.hospital_id).nurses.find(params[:id])
    end
  end

  def edit
    @nurse = User.find(params[:user_id]).nurse
  end

  def update
    @nurse = User.find(params[:user_id]).nurse
    if is_web_admin?
      @nurse.hospital_id = params[:nurse][:hospital_id]
    end
    if @nurse.update(nurse_params)
      redirect_to nurses_path
    else
      render 'edit'
    end
  end

  def destroy
    @nurse = User.find(params[:user_id]).nurse
    @nurse.destroy
    redirect_to nurses_path
  end

  private

  def web_admins_initialize_data
    @hospitals = Hospital.all
  end

  def nurse_params
    params.require(:nurse).permit(:phone_number, :blood_type, :height, :weight)
  end
end

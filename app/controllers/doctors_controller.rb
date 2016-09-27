class DoctorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :web_admins_initialize_data, only: [:new, :create, :edit, :update], if: :is_web_admin?

  def index
    if is_web_admin?
      @doctors = Doctor.all
    elsif is_hos_admin?
      @doctors = Hospital.find(current_user.hos_admin.hospital_id).doctors
    end
  end

  def new
    @doctor = User.find(params[:user_id]).build_doctor
  end

  def create
    @doctor = User.find(params[:user_id]).build_doctor(doctor_params)
    if is_web_admin?
      @doctor.hospital_id = params[:doctor][:hospital_id]
      @polyclinics = Polyclinic.where(id: params[:doctor][:polyclinics])
      @doctor.polyclinics << @polyclinics
    elsif is_hos_admin?
      @doctor.hospital_id = current_user.hos_admin.hospital_id
      @polyclinics = Hospital.find(current_user.hos_admin.hospital_id).polyclinics.where(id: params[:doctor][:polyclinics])
      @doctor.polyclinics << @polyclinics
    end
    if @doctor.save
      redirect_to doctors_path
    else
      render 'new'
    end
  end

  def show
    if is_web_admin?
      @doctor = Doctor.find(params[:id])
    elsif is_hos_admin?
      @doctor = Hospital.find(current_user.hos_admin.hospital_id).doctors.find(params[:id])
    end
  end

  def edit
    @doctor = User.find(params[:user_id]).doctor
  end

  def update
    @doctor = User.find(params[:user_id]).doctor
    if is_web_admin?
      @doctor.hospital_id = params[:doctor][:hospital_id]
      @polyclinics = Polyclinic.where(id: params[:doctor][:polyclinics])
      @doctor.polyclinics.destroy_all
      @doctor.polyclinics << @polyclinics
    elsif is_hos_admin?
      @polyclinics = Hospital.find(current_user.hos_admin.hospital_id).polyclinics.where(id: params[:doctor][:polyclinics])
      @doctor.polyclinics.destroy_all
      @doctor.polyclinics << @polyclinics
    end
    if @doctor.update(doctor_params)
      redirect_to doctors_path
    else
      render 'edit'
    end
  end

  def destroy
    @doctor = User.find(params[:user_id]).doctor
    @doctor.destroy
    redirect_to doctors_path
  end

  def polyclinics
    if is_web_admin?
      respond_to do |format|
        format.json {
          render json: Hospital.find(params[:hospital_id]).polyclinics
        }
      end
    end
  end

  private

  def web_admins_initialize_data
    @hospitals = Hospital.all
  end

  def doctor_params
    params.require(:doctor).permit(:speciality, :hours_from, :hours_to, :phone_number, :blood_type, :height, :weight)
  end
end

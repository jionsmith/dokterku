class OutPatientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :initialize_data, only: [:new, :create, :edit, :update], if: :is_hos_admin?
  before_action :initialize_data, only: [:new, :create, :edit, :update], if: :is_reg_admin?

  def index
    if is_doctor?
      @out_patients = current_user.doctor.out_patients.order(:created_at)
    elsif is_hos_admin? || is_reg_admin?
      @out_patients = get_hospital.out_patients.order(:created_at)
    end
  end

  def new
    if is_hos_admin? || is_reg_admin?
      @out_patient = get_hospital.out_patients.build
    end
  end

  def create
    if is_hos_admin? || is_reg_admin?
      @out_patient = get_hospital.out_patients.build(out_patient_params)
      @out_patient.generate_rm_number
      @out_patient.generate_queue_number
      if @out_patient.save
        redirect_to out_patients_path
      else
        render 'new'
      end
    end
  end

  def show
    if is_hos_admin? || is_reg_admin?
      @out_patient = get_out_patient(params[:id])
    end
  end

  def edit
    if is_hos_admin? || is_reg_admin?
      @out_patient = get_out_patient(params[:id])
    end
  end

  def update
    if is_hos_admin? || is_reg_admin?
      @out_patient = get_out_patient(params[:id])
      if @out_patient.update(out_patient_params)
        redirect_to out_patient_path(@out_patient)
      else
        render 'edit'
      end
    end
  end

  def destroy
    if is_hos_admin? || is_reg_admin?
      @out_patient = get_out_patient(params[:id])
      @out_patient.destroy
      redirect_to out_patients_path
    end
  end

  def doctors
    if is_hos_admin? || is_reg_admin?
      respond_to do |format|
        format.json {
          doctors = get_hospital.polyclinics.find(params[:polyclinic_id]).doctors.map { |doctor| { id: doctor.id, full_name: doctor.full_name } }
          render json: doctors
        }
      end
    else
      redirect_user
    end
  end

  private

  def get_hospital
    hospital = current_user.hos_admin ? current_user.hos_admin.hospital_id : current_user.reg_admin.hospital_id
    Hospital.find(hospital)
  end

  def get_out_patient(id)
    get_hospital.out_patients.find(id)
  end

  def initialize_data
    @doctors = get_hospital.doctors
    @polyclinics = get_hospital.polyclinics
    @patients = get_hospital.patients
  end

  def out_patient_params
    params.require(:out_patient).permit(:visit, :name, :gender, :date_of_birth, :age, :reason_for_visit, :specialist, :patient_id, :doctor_id, :polyclinic_id)
  end
end

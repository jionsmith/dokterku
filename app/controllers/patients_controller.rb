class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :web_admins_initialize_data, only: [:new, :create, :edit, :update], if: :is_web_admin?

  def index
    if is_web_admin?
      @patients = Patient.all
    elsif is_hos_admin? || is_reg_admin?
      hospital = current_user.hos_admin ? current_user.hos_admin.hospital_id : current_user.reg_admin.hospital_id
      @patients = Hospital.find(hospital).patients
    end
  end

  def new
    @patient = User.find(params[:user_id]).build_patient
  end

  def create
    @patient = User.find(params[:user_id]).build_patient(patient_params)
    if is_web_admin?
      @patient.hospital_id = params[:patient][:hospital_id]
    elsif is_hos_admin? || is_reg_admin?
      hospital = current_user.hos_admin ? current_user.hos_admin.hospital_id : current_user.reg_admin.hospital_id
      @patient.hospital_id = hospital
    end
    if @patient.save
      redirect_to patients_path
    else
      render 'new'
    end
  end

  def show
    if is_web_admin?
      @patient = Patient.find(params[:id])
    elsif is_hos_admin? || is_reg_admin?
      hospital = current_user.hos_admin ? current_user.hos_admin.hospital_id : current_user.reg_admin.hospital_id
      @patient = Hospital.find(hospital).patients.find(params[:id])
    end
  end

  def edit
    @patient = User.find(params[:user_id]).patient
  end

  def update
    @patient = User.find(params[:user_id]).patient
    if is_web_admin?
      @patient.hospital_id = params[:patient][:hospital_id]
    end
    if @patient.update(patient_params)
      redirect_to patients_path
    else
      render 'edit'
    end
  end

  def destroy
    @patient = User.find(params[:user_id]).patient
    @patient.destroy
    redirect_to patients_path
  end

  private

  def web_admins_initialize_data
    @hospitals = Hospital.all
  end

  def patient_params
    params.require(:patient).permit(
      :place_of_birth,
      :kelurahan,
      :kecamatan,
      :city,
      :rt_rw,
      :provinsi,
      :last_education,
      :religion,
      :nationality,
      :blood_type,
      :marital_status,
      :id_type,
      :id_number,
      :phone_number,
      :mobile_number,
      :patient_occupation,
      :name_of_company,
      :company_address,
      :company_phone,
      :father_name,
      :father_id_number,
      :father_address,
      :father_phone_number,
      :father_mobile_number,
      :father_email,
      :mother_name,
      :mother_id_number,
      :mother_address,
      :mother_phone_number,
      :mother_mobile_number,
      :mother_email,
      :spouse_name,
      :spouse_id_number,
      :spouse_address,
      :spouse_phone_number,
      :spouse_mobile_number,
      :spouse_email,
      :emergency_contact_name,
      :relationship_to_patient,
      :emergency_contact_address,
      :emergency_contact_phone_number,
      :emergency_contact_mobile_number,
      :emergency_contact_email,
      :method_of_payment,
      :credit_card_number,
      :bpjs_number,
      :insurance_company,
      :insurance_id_number,
      :insurance_policy_number
    )
  end
end

class HospitalsController < ApplicationController

  before_action :authenticate_user!
  # before_action :initialize_data, only: [:new, :create, :edit, :update], if: :is_web_admin?


  def index
    if is_web_admin?
      @hospitals = Hospital.all
    end
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      params[:hospital][:polyclinics].compact.reject(&:empty?).each do |polyclinic|
        @hospital.polyclinics.create(name: polyclinic)
      end
      redirect_to hospitals_path
    else
      render 'new'
    end
  end

  def show
    @hospital = get_hospital(params[:id])
    # if is_web_admin?
    #   @hospital = get_hospital(params[:id])
    # end
  end

  def edit
    @hospital = get_hospital(params[:id])
  end

  def update
    if is_web_admin?
      @hospital = get_hospital(params[:id])
      if @hospital.update(hospital_params)
        params[:hospital][:polyclinics].compact.reject(&:empty?).each do |polyclinic|
          @hospital.polyclinics.create(name: polyclinic) unless @hospital.polyclinics.exists?(name: polyclinic)
        end
        @hospital.polyclinics.each do |polyclinic|
          polyclinic.destroy unless params[:hospital][:polyclinics].index(polyclinic.name)
        end
        redirect_to hospital_path(@hospital)
      else
        render 'edit'
      end
    end
  end

  def destroy
    if is_web_admin?
      @hospital = get_hospital(params[:id])
      @hospital.destroy
      redirect_to hospitals_path
    end
  end

  private

  def get_hospital(id)
    Hospital.find(id)
  end

  def hospital_params
    params.require(:hospital).permit(:logo, :name, :address, :address_2, :city, :state, :zip_code, :country, :phone_number, :fax, :email, :website)
  end

  def initialize_data
    @polyclinics = [
      'Akupunktur',
      'Bedah Anak',
      'Bedah Anak',
      'Bedah Digestif',
      'Bedah Mulut',
      'Bedah Orthopedi',
      'Bedah Pembuluh Darah',
      'Bedah Plastik',
      'Bedah Saluran Kemih',
      'Bedah Saraf',
      'Bedah Syaraf',
      'Bedah Thorax & Kardiovaskuler',
      'Bedah Tulang',
      'Bedah Tumor',
      'Bedah Umum',
      'Day Care',
      'Estetika & Meratakan Gigi',
      'Geriatri',
      'Kardiologi',
      'Kecantikan',
      'Keluarga Berencana',
      'Kesehatan Anak',
      'Kesehatan Gigi',
      'Kesehatan Jiwa',
      'KIA (kesehatan ibu dan anak)',
      'Konsultasi Gizi',
      'Kusta',
      'Laboratorium',
      'Napza',
      'OBGYN (Kebidanan dan Kandungan)',
      'Orthopedi',
      'Penyakit Dalam',
      'Penyakit Dalam',
      'Penyakit Ginjal',
      'Penyakit Hati & Saluran Pencernaan',
      'Penyakit Jantung',
      'Penyakit Kulit & Kelamin',
      'Penyakit Mata',
      'Penyakit Paru',
      'Penyakit Syaraf',
      'Penyakit THT',
      'Psikologi',
      'Radiologi',
      'Rawat Darurat',
      'Rehabilitasi Medik',
      'Urologi',
      'Umum',
      'CT-Scan',
      'Fisioterapi',
      'Hemodialisa',
      'Lab',
      'MRI',
      'Radiology',
      'UGD / IGD Admins'
    ]
  end
end

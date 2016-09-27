class HospitalStepsController < ApplicationController

  before_action :authenticate_user!

  def step_two
    @hospital = Hospital.find_by(:id => params[:id], :admin_mr => current_user.rm_number)
  end

  def step_three
    @hospital = Hospital.find_by(:id => params[:id], :admin_mr => current_user.rm_number)
  end

  def step_four
    @hospital = Hospital.find_by(:id => params[:id], :admin_mr => current_user.rm_number)
    @departments = Department.all.order(:name => :asc)
  end

  def add_inst_details
    hospital = Hospital.find_by(id: params[:id], admin_mr: current_user.rm_number)
    if hospital.present?
      hospital.update(hospital_params)
      redirect_to "/hospitals/#{hospital.id}/step_three"
    else
      redirect_to '/institutions/new'
    end
  end

  private

    def hospital_params
      params[:country] = params[:country]["data"] if params[:country].present?
      params[:director_mr] = get_director
      params.permit(:address, :country, :director_mr, :district, :rt_rw, :regency, :kelurahan, :city, :province, :zip_code,
                    :land_area, :building_aream, :maps_link, :contacts, :fax, :email, :phone, :website, :icu_no_telp)
    end

    def get_director
      if params[:director_mr].present?
        if User.where(:rm_number => params[:director_mr]).exists?
          return params[:director_mr]
        else
          nil
        end
      else
        nil
      end
    end

end
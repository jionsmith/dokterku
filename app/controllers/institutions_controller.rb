class InstitutionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @institutions = current_user.institutions
  end

  def new
    @institution = Institution.new
  end

  def create
    institution = Institution.new(inst_params)
    if institution.save
      case params[:inst_type]
        when 'hospital'
          hospital_create(institution)
        when 'pharmacy'
          hospital_create(institution)
        else ''
          hospital_create(institution)
      end
    else
      respond_to do |format|
        format.html { redirect_to '/institutions/new', alert:  institution.errors.full_messages}
        format.json {
          render json: {:status => 1, :message => institution.errors.full_messages}, :status => 400
        }
      end
    end
  end

  def show
    @institution = get_institution(params[:id])
    @employees = @institution.users
  end

  def edit
    @institution = get_institution(params[:id])
  end

  def update
    @institution = get_institution(params[:id])
    if @institution.update(institution_params)
      redirect_to institution_path(@institution)
    else
      render 'edit'
    end
  end

  def destroy
    @institution = get_institution(params[:id])
    @institution.destroy
    redirect_to institutions_path
  end

  def hospital_create(institution)
    hospital = institution.build_hospital(hospitals_params)
    if hospital.save
      respond_to do |format|
        format.html { redirect_to "/hospitals/#{hospital.id}/step_two" }
        format.json {
          render json: {:status => 0, :message => 'success', :data => hospital}, :status => 200
        }
      end
    end
  end

  private

  def get_institution(id)
    current_user.institutions.find(id)
  end

  def institution_params
    params.require(:institution).permit(:name, :address_1, :address_2, :city, :state, :zip, :country)
  end

  def inst_params
    params.permit(:name, :admin_mr, :inst_type)
  end

  def hospitals_params
    params[:director_mr] = get_director
    params.permit(:number_code_rs, :type_of_hospital, :name, :hospital_class, :director_mr, :admin_mr, :organizer, :organizer_rs,
    :status, :date_started, :pentahapan, :accreditation_department, :accreditation_date, :determination, :license_number,
    :certificate_number, :sertificate_date, :certificate_by, :sifat, :validity_period, :motto, :mission, :visions)
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

class PharmaciesController < ApplicationController
  before_action :authenticate_user!

  def new
    @institution = Institution.find_by_id(params[:institution_id])
    # @pharmacy = Pharmacy.new
  end

  def create
    inst = Institution.find_by(:id => params[:institution_id], :admin_mr => current_user.rm_number)
    render json: {:status => 1, :message => 'institution not found'}, :status => 400 and return if inst.nil?
    pharm = inst.pharmacies.build(pharmacy_params)
    respond_to do |format|
      if pharm.save
        format.html {redirect_to institutions_path, notice: 'Pharmacy created successfully'}
        format.json {render json: {:status => 0, :message => 'success', :data=> pharm}, :status => 200}
      else
        format.html {render 'new'}
        format.json {render json: {:status => 0, :message => pharm.errors.full_messages}, :status => 400}
      end
    end

  end

  def destroy

  end


  private

    def pharmacy_params
      params[:country] = params[:country]['data'] if params[:country].present?
      params.permit(:supplier_code, :company_name, :name, :phone, :email, :address, :country, :rt_rw, :district, :kelurahan,
                    :city, :province, :zip_code)
    end

end
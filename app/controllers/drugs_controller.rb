class DrugsController < ApplicationController

  before_action :authenticate_user!

  def new
    @institution = Institution.find_by_id(params[:institution_id])
    @suppliers = @institution.suppliers_institutions.as_json(:include => {:supplier => {:only => [:name]}})
    @drug = Drug.new
  end

  def create
    inst = Institution.find_by(:id => params[:institution_id], :admin_mr => current_user.rm_number)
    render json: {:status => 1, :message => 'institution not found'}, :status => 400 and return if inst.nil?
    supplier = Supplier.find_by_id(params[:supplier_id])
    render json: {:status => 2, :message => 'supplier not found'}, :status => 400 and return if supplier.nil?
    drug = Drug.new(drug_params)
    respond_to do |format|
      if drug.save
        format.html {redirect_to institutions_path, notice: 'Drug created successfully'}
        format.json {render json: {:status => 0, :message => 'success', :data=> drug}, :status => 200}
      else
        format.html {render 'new'}
        format.json {render json: {:status => 3, :message => drug.errors.full_messages}, :status => 400}
      end
    end
  end

  def destroy

  end

  private

    def drug_params
      params.permit(:name, :code, :supplier_price, :type_drug, :supplier_id)
    end

end
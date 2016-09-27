class SuppliersController < ApplicationController
  before_action :authenticate_user!

  def index
    data = []
    suppliers = Supplier.all
    data = suppliers.select {|supplier| supplier.name == params[:name]} if params[:search_type] == 'name'
    data = suppliers.select {|supplier| supplier.supplier_code == params[:supplier_code]} if params[:search_type] == 'code'
    render json: {:status => 0, :message => 'success', :data => data}, :status => 200
  end

  def new
    @institution = Institution.find_by_id(params[:institution_id])
    @supplier = Supplier.new
  end

  def create
    inst = Institution.find_by(:id => params[:institution_id], :admin_mr => current_user.rm_number)
    render json: {:status => 1, :message => 'institution not found'}, :status => 400 and return if inst.nil?
    supplier = Supplier.new(supplier_params)
    if supplier.save
      inst.suppliers_institutions.create(:supplier_id => supplier.id)
      respond_to do |format|
        format.html {redirect_to institutions_path, notice: 'Supplier added successfully'}
        format.json {render json: {:status => 0, :message => 'success', :data=> pharm}, :status => 200}
      end
    else
      format.json {render json: {:status => 0, :message => supplier.errors.full_messages}, :status => 400}
    end
  end

  def assign
    inst = Institution.find_by(:id => params[:id], :admin_mr => current_user.rm_number)
    render json: {:status => 1, :message => 'institution not found'}, :status => 400 and return if inst.nil?
    supplier = Supplier.find_by_id(params[:supplier_id])
    render json: {:status => 1, :message => 'supplier not found'}, :status => 400 and return if supplier.nil?
    inst.suppliers_institutions.create(:supplier_id => supplier.id)
    respond_to do |format|
      format.html {redirect_to institutions_path, notice: 'Supplier added successfully'}
      format.json {render json: {:status => 0, :message => 'success'}, :status => 200}
    end
  end

  def destroy

  end


  private

  def supplier_params
    params[:country] = params[:country]['data'] if params[:country].present?
    params.permit(:supplier_code, :company_name, :name, :phone, :email, :address, :country, :rt_rw, :district, :kelurahan,
                  :city, :province, :zip_code)
  end
end
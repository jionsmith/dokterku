class DepartmentsController < ApplicationController
  before_action :authenticate_user!

  def add_in_inst
    hospital = Hospital.find_by(:id => params[:id], :admin_mr => current_user.rm_number)
    redirect_to '/institutions/new' if hospital.nil?
    if params[:departments].present? && params[:departments].any?
      params[:departments].each do |name|
        dep = Department.find_by_name(name)
        if dep.present?
          hospital.hospitals_departments.create(:department_id => dep.id)
        end
      end
      redirect_to '/institutions'
    else
      redirect_to '/institutions'
    end
  end

end
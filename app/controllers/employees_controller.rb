class EmployeesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @user = User.find_by(rm_number: params[:rm_number])
    @institution = get_institution(params[:institution_id])
    if @user
      @institution.users << @user
    else
      flash[:alert] = 'We couldn\'t find a user with the specified RM number.'
    end
    redirect_to @institution
  end

  def destroy
    @institution = get_institution(params[:institution_id])
    @user = @institution.users.find(params[:id])
    @institution.users.delete(@user)
    redirect_to institutions_path
  end

  private

  def get_institution(id)
    current_user.institutions.find(id)
  end
end

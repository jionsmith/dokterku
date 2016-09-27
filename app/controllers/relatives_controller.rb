class RelativesController < ApplicationController
  before_action :authenticate_user!, except: %i(search_relative create)

  def search_relative
    user = User.find_by_rm_number(params[:rm_number])
    if user.present?
      render json: {:status => 0, :message => 'success', :data => user}, :status => 200
    else
      render json: {:status => 1, :message => 'user not found'}, :status => 200
    end
  end

  def create
    relative = User.find_by_rm_number(params[:rm_number])
    render json: {:status => 2, :message => 'user not found'}, :status => 400 and return if relative.nil?
    current_user.relatives.create(:relative_id => params[:rm_number], :relative_type => params[:relative_type])
    render json: {status: 0, :message => 'success'}, :status => 200
  end


end
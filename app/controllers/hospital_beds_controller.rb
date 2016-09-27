class HospitalBedsController < ApplicationController

  before_action :authenticate_user!

  def create
    hospital = Hospital.find_by(:id => params[:id], :admin_mr => current_user.rm_number)
    if hospital.present?
      hospital.create_bed(bed_params)
      redirect_to "/hospitals/#{hospital.id}/step_four"
    else
      redirect_to '/institutions/new'
    end
  end


  private

    def bed_params
      params.permit(:vvip, :vvip_free, :vip, :vip_free, :i, :i_free, :ii, :ii_free, :iii, :iii_free, :ruang_isolasi, :ruang_isolasi_free,
                    :igd, :igd_free, :vk, :vk_free, :ok, :ok_free, :perinatologi, :perinatologi_free, :icu, :icu_free,
                    :picu, :picu_free, :nicu, :nicu_free, :iccu, :iccu_free, :icu, :icu_free, :hcu, :hcu_free)
    end

end
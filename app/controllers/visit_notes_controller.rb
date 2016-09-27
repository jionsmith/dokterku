class VisitNotesController < ApplicationController
  before_action :authenticate_user!

  def new
    @institution = Institution.find_by_id(params[:institution_id])
  end

  def create
    inst = Institution.find_by_id(params[:institution_id])
    render json: {:status => 1, :message => 'institution not found'}, :status => 400 and return if inst.nil?
    user = User.last
    note = user.visit_notes.build(visit_note_params)
    if note.save
      respond_to do |format|
        format.html {redirect_to "/institutions/1/visit_notes/#{note.id}/step_two"}
        format.json {render json: {:status => 0, :message => 'success', :data => note}, :status => 200}
      end
    else
      respond_to do |format|
        format.html {render "new", alert: note.errors.full_messages}
        format.json {render json: {:status => 0, :message => note.errors.full_messages}, :status => 400}
      end
    end

  end

  def destroy

  end


  private

    def visit_note_params
      params.permit(:reason, :symptoms, :medical_history, :awareness, :pulse, :respiratory, :temperature, :blood_pressure,
                    :head, :eye, :multi, :tooth, :throat, :neck, :chest, :quality_heart, :lungs, :liver, :lien, :kidneys,
                    :stomach, :contents, :genitals, :height, :weight, :bmi, :bp, :institution_id)
    end


end
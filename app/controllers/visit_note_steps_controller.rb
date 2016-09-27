class VisitNoteStepsController < ApplicationController

  before_action :authenticate_user!

  def step_two
    @institution = Institution.find_by_id(params[:institution_id])
    @note = VisitNote.find_by_id(params[:id])
  end

  def step_three
    @institution = Institution.find_by_id(params[:institution_id])
    @note = VisitNote.find_by_id(params[:id])
  end

  def step_four
    @institution = Institution.find_by_id(params[:institution_id])
    @note = VisitNote.find_by_id(params[:id])
  end

  def step_five
    @institution = Institution.find_by_id(params[:institution_id])
    @note = VisitNote.find_by_id(params[:id])
  end

  def step_six
    @institution = Institution.find_by_id(params[:institution_id])
    @note = VisitNote.find_by_id(params[:id])
  end


  def set_diagnosis
    note = VisitNote.find_by_id(params[:id])
    render json: {:status => 1, :message => 'visit note not found'}, :status => 400 and return if note.nil?
    diagnosis = note.build_visit_diagnostic(diagnostic_params)
    if diagnosis.save
      respond_to do |format|
        format.html {redirect_to "/institutions/#{params[:institution_id]}/visit_notes/#{note.id}/step_three"}
        format.json {render json: {:status => 0, :message => 'success', :data => diagnosis}, :status => 200}
      end
    else
      respond_to do |format|
        format.html {render 'step_two', alert: diagnosis.errors.full_messages}
        format.json {render json: {:status => 2, :message => diagnosis.errors.full_messages}, :status => 400}
      end
    end
  end

  def set_therapy
    note = VisitNote.find_by_id(params[:id])
    render json: {:status => 1, :message => 'visit note not found'}, :status => 400 and return if note.nil?
    therapy = note.visit_therapies.build(therapy_params)
    if therapy.save
      respond_to do |format|
        format.html {redirect_to "/institutions/#{params[:institution_id]}/visit_notes/#{note.id}/step_four"}
        format.json {render json: {:status => 0, :message => 'success', :data => therapy}, :status => 200}
      end
    else
      respond_to do |format|
        format.html {render 'step_three', alert: therapy.errors.full_messages}
        format.json {render json: {:status => 2, :message => therapy.errors.full_messages}, :status => 400}
      end
    end
  end

  def set_action
    note = VisitNote.find_by_id(params[:id])
    render json: {:status => 1, :message => 'visit note not found'}, :status => 400 and return if note.nil?
    action = note.visit_actions.build(action_params)
    if action.save
      respond_to do |format|
        format.html {redirect_to "/institutions/#{params[:institution_id]}/visit_notes/#{note.id}/step_five"}
        format.json {render json: {:status => 0, :message => 'success', :data => action}, :status => 200}
      end
    else
      respond_to do |format|
        format.html {render 'step_four', alert: action.errors.full_messages}
        format.json {render json: {:status => 2, :message => action.errors.full_messages}, :status => 400}
      end
    end
  end

  def set_allergies
    note = VisitNote.find_by_id(params[:id])
    render json: {:status => 1, :message => 'visit note not found'}, :status => 400 and return if note.nil?
    if params[:allergies].present? && params[:allergies].class == 'Array'
      params[:allergies].each do |allergie|
        note.visit_allergy_histories.create(:substance => allergie.substance, :reaction => allergie.reaction)
      end
    end
    respond_to do |format|
      format.html {redirect_to "/institutions/#{params[:institution_id]}/visit_notes/#{note.id}/step_six"}
      format.json {render json: {:status => 0, :message => 'success'}, :status => 200}
    end
  end

  def set_medical_treatment
    debugger
    note = VisitNote.find_by_id(params[:id])
    render json: {:status => 1, :message => 'visit note not found'}, :status => 400 and return if note.nil?
    treatment = note.visit_medicines.build(medical_treatment_params)
    if treatment.save
      respond_to do |format|
        format.html {redirect_to institutions_path}
        format.json {render json: {:status => 0, :message => 'success'}, :status => 200}
      end
    else
      respond_to do |format|
        format.html {render 'step_six', alert: treatment.errors.full_messages}
        format.json {render json: {:status => 0, :message => treatment.errors.full_messages}, :status => 400}
      end
    end
  end

  private

    def diagnostic_params
      params.permit(:initial_diagnosis, :differential_diagnosis, :final_diagnosis, :diagnosis_of_complications, :second_diagnosis)
    end

    def therapy_params
      params.permit(:injection, :infusion, :transfusion, :oral)
    end

    def action_params
      params.permit(:therapeutic_action, :diagnosis_action, :medical_actions)
    end

    def medical_treatment_params
      params.permit(:name, :type_of_drugs, :dosage, :qty, :start_date, :end_date)
    end

end
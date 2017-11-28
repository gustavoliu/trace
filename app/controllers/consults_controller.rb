class ConsultsController < ApplicationController
  before_action :set_consult, only: [:show, :edit, :update]

  def new_with_soap
    @patient = Patient.find(params[:patient_id])
    @consult = Consult.new
    @consult.patient = @patient

    @consult.professional = current_user.professional
    @consult.place = Consult.places.keys.first
    @consult.unit_cnes = @consult.professional.unit_cnes
    @consult.team_number = @consult.professional.team_number
    @consult.consult_date = Date.today

    hour_now = Time.now.hour
    if hour_now > 6 && hour_now < 12
      @consult.turn = Consult.turns.keys[0]
      elsif hour_now >= 12 && hour_now < 18
      @consult.turn = Consult.turns.keys[1]
      else
      @consult.turn = Consult.turns.keys[2]
    end

    if @consult.save
      redirect_to  consult_path(@consult)
    else
      render :new
    end

  end


  def new
    @consult = Consult.new
    @patient = Patient.find(params[:patient_id])
    @consult.professional = current_user.professional

  end

  def create
    @consult = Consult.new(consult_params)
    @consult.patient = Patient.find(params[:patient_id])
    @consult.professional = current_user.professional

    if @consult.save
      redirect_to  consult_path(@consult)
    else
      render :new
    end
  end

  def show
    @consult= Consult.find(params[:id])
    @patient = @consult.patient
    @soap = Soap.new
    @soaps = @consult.soaps.all
    @complaints = Disease.all
    @diagnoses = Disease.where(is_diagnosis: true)
  end

  def edit
  end

  def list_consults_by_date
    @date = Date.today
    @consults = Consult.where("consult_date = ?", @date)
  end

  def update
  if @consult.update(consult_params)
      redirect_to @consult
    else
      render :edit
    end
  end


  private

  def set_consult
    @consult = Consult.find(params[:id])
  end

  def consult_params
    params.require(:consult).permit( :consult_date, :turn, :unit_cnes, :team_number, :place, :patient_id, :professional_id)
  end

end

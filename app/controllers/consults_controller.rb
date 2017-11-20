class ConsultsController < ApplicationController

  def new
    @consult = Consult.new
    @patient = Patient.find(params[:patient_id])
  end

  def create
    @consult = Consult.new(consult_params)
    @consult.patient = Patient.find(params[:patient_id])
    @consult.professional = current_user.professional
    if @consult.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def consult_params
    params.require(:consult).permit( :consult_date, :turn, :unit_cnes, :team_number, :place, :patient_id, :professional_id)
  end

end

class SoapsController < ApplicationController

  def new
    @soap = Soap.new
    @consult = Consult.find(params[:consult_id])
    @patient = Patient.find(params[:patient_id])
  end

  def create
    @soap = Soap.new(soap_params)
    @soap.consult = Consult.find(params[:consult_id])
    @soap.consult.patient = Patient.find(params[:patient_id])

    if @soap.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def soap_params
    params.require(:soap).permit( :complaint, :diagnosis, :exams, :refering, :consult_id )
  end
end

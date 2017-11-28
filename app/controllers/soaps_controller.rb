class SoapsController < ApplicationController
  before_action :set_soap, only: [:show, :edit, :update]

  def new
    @soap = Soap.new
    @consult = Consult.find(params[:consult_id])
  end

  def create
    @soap = Soap.new(soap_params)
    @consult = Consult.find(params[:consult_id])
    @soap.consult = Consult.find(params[:consult_id])
    # @soap.complaint = Disease.find_by(ciap_code: params[:soap][:complaint])
    # @soap.diagnosis = Disease.find_by(ciap_code: params[:soap][:diagnosis])

    if @soap.save
      redirect_to consult_path(@consult)
    else
      @soaps = @consult.soaps
      @patient = @consult.patient
      @complaints = Disease.all
      @diagnoses = Disease.where(is_diagnosis: true)
      render template: 'consults/show'
    end
  end

  def edit
    @consult = @soap.consult
  end

  def update
  if @soap.update(soap_params)
      redirect_to patient_path(@soap.consult.patient)
    else
      render :edit
    end
  end

  def destroy
    @soap.destroy
    redirect_to soap_index_path
  end


  private

  def set_soap
    @soap = Soap.find(params[:id])
  end

  # def set_patient
  #   @soap = Soap.find(params[:id])
  # end

  def soap_params
    params.require(:soap).permit(:complaint_id, :diagnosis_id, referring: [], exams: [] )
  end
end

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

    if @soap.save
      redirect_to consult_path(@consult)
    else
      render :new
    end
  end

  def edit
  end

  def update
  if @soap.update(soap_params)
      redirect_to @soap
    else
      render :edit
    end
  end

  def destroy
    @soap.destroy
    redirect_to soap_index_path
  end


  private

  def set_patient
    @soap = Soap.find(params[:id])
  end

  def soap_params
    params.require(:soap).permit( :complaint, :diagnosis, :exams, :refering, :consult_id )
  end
end

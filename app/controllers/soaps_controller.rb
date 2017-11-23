class SoapsController < ApplicationController

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

  private

  def soap_params
    params.require(:soap).permit( :complaint, :diagnosis, :consult_id, refering: [], exams: [] )
  end
end

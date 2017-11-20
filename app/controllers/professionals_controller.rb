class ProfessionalsController < ApplicationController

  def edit
    @professional = Professional.find(params[:id])
    @professional.update(professional_params)
    @professional.save
  end

  def update
  end

  def show
    @professional = Professional.find(params[:id])
  end

  def destroy
  end

  private

  def professional_params
    params.require(:professional).permit(:full_name, :professional_number, :photo, :birthday, :profession, :sus_number)
  end

  def set_professional
    @professional = Professional.find(params[:id])
  end

end

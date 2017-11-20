class ProfessionalsController < ApplicationController

  def edit
    @professional = Professional.find(params[:id])
  end

  def update
    @professional = Professional.find(params[:id])
    @professional.update(professional_params)
    @professional.save
  end

  def show
    @professional = Professional.find(params[:id])
  end

  def destroy
  end

  private

  def professional_params
    params.require(:professional).permit(:user_id, :full_name, :professional_number, :photo, :birthday, :profession, :sus_number)
  end

  def set_professional
    @professional = Professional.find(params[:id])
  end

end

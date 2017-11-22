class ProfessionalsController < ApplicationController

  def edit
    @professional = Professional.find(params[:id])
  end

  def update
    @professional = Professional.find(params[:id])
    @professional.update(professional_params)
    @professional.save
    redirect_to professional_path
  end

  def show
    @professional = Professional.find(params[:id])
  end

  def destroy
  end

  private

  def professional_params
    params.require(:professional).permit(:user_id, :full_name, :professional_number, :photo, :birthday, :profession, :sus_number, :unit_cnes, :team_number)
  end

  def set_professional
    @professional = Professional.find(params[:id])
  end

end

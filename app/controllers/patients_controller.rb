class PatientsController < ApplicationController

  before_action :set_patient, only: [:show, :edit, :update]

  def index
    @patients = Patient.all

    if params[:term].present?
      @patients = @patients.search_by_full_name(params[:term])
    else
      @patients = @patients.joins(:consults).where("consults.consult_date" => Date.current).distinct
    end

    # if params[:address].present?
    #   @rooms = @patients.near(params[:address], 10)
    # end

    # @hash = Gmaps4rails.build_markers(@patients) do |patient, marker|
    #   marker.lat room.latitude
    #   marker.lng room.longitude
    #   # marker.infowindow render_to_string(partial: "/rooms/map_box", locals: { room: room })
    # end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patient_index_path
  end


  private

  def patient_params
    params.require(:patient).permit(:full_name, :birthday, :sus_number, :gender, :address, :prontuario_number )
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end

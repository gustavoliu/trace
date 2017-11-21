class PatientsController < ApplicationController

  before_action :set_patient, only: [:show, :edit]

  def index

    if params[:term]
      @patients = Patient.search_by_full_name(params[:term])
    else
      @patients = Patient.all
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
    @patient.update(patient_params)
  end

  private

  def patient_params
    params.require(:patient).permit(:full_name, :birthday, :sus_number, :gender, :address, :prontuario_number )
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end

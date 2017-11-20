class Patient < ApplicationRecord
  before_action :set_patient, only: [:show, :edit]

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.save
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

class ReportsController < ApplicationController

  def get_consults
  end

  def get_diagnosis
  end


  def index
    @patients = Patient.all

    if params[:address].present?
      @patients = @patients.near(params[:address], 10)
    end

    # if params[:term].present?
    #   @patients = Consults.search_by_consult_date(params[:term])
    # end

    # if params[:term].present?
    #   @patients = @patients.joins(consults: :soaps).where("soaps.diagnosis" => param[:term])
    # end


    @hash = Gmaps4rails.build_markers(@patients) do |patient, marker|
      marker.lat patient.latitude
      marker.lng patient.longitude
    end

  end


end

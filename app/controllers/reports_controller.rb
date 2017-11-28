class ReportsController < ApplicationController

  def get_consults
    months = if params[:months].present?
               params[:months].to_i
             else
               2
             end

    @consults_by_month = (0..months).map do |offset|
      month = Time.current - offset.month
      [
        month.strftime("%B %Y"),
        Consult.by_month(month).count
      ]
    end
  end

  def get_diagnosis
    # @consults = Consult.where(consult_date: "Fri, 24 Nov 2017")
    #@diagnosis = Soap.select([:diagnosis, consult_id: consults]).group(:created_at).first(10)

    @diagnosis = Soap.where(created_at: Time.current.beginning_of_month..Time.current.end_of_month)
                  .group(:diagnosis_id) # diagnosis_id
                  .order("COUNT(diagnosis_id) DESC")
                  .limit(10)
                  .count
  end

  def index
    @patients = Patient.all.joins(consults: { soaps: :diagnosis })

    if params[:start_date].present?
      start_date = Date.parse(params[:start_date])
      @patients = @patients.where("consults.consult_date >= ?", start_date)
    end

    if params[:end_date].present?
      end_date = Date.parse(params[:end_date])
      @patients = @patients.where("consults.consult_date <= ?", end_date)
    end

    # if params[:address].present?
    #   @patients = @patients.near(params[:address], 10)
    # end

    # if params[:term].present?
    #   @patients = Consults.search_by_consult_date(params[:term])
    # end

    if params[:term].present?
      @patients = @patients.where("diseases.ciap_code ILIKE ?", "%#{params[:term]}%")
    end


    @hash = Gmaps4rails.build_markers(@patients) do |patient, marker|
      marker.lat patient.latitude
      marker.lng patient.longitude
    end

  end
end

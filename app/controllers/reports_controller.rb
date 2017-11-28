class ReportsController < ApplicationController

  def get_consults
    @since = 3.months.ago.beginning_of_month

    if params["since(1i)"].present?
      @since = Date.new(params["since(1i)"].to_i, params["since(2i)"].to_i)
    end
    @consults_by_month = Consult.where(consult_date: @since..Date.current)
                          .group("date_trunc('month', consult_date)")
                          .count
                          .map do |month, count|
                            [month.strftime("%B %Y"), count]
                          end
  end

  def get_diagnosis
    # @consults = Consult.where(consult_date: "Fri, 24 Nov 2017")
    #@diagnosis = Soap.select([:diagnosis, consult_id: consults]).group(:created_at).first(10)
    @month = Date.current.beginning_of_month
    if params["month(1i)"].present?
      @month = Date.new(params["month(1i)"].to_i, params["month(2i)"].to_i)
    end
    @diagnosis = Soap.where(created_at: @month..@month.end_of_month)
                  .group(:diagnosis_id) # diagnosis_id
                  .order("COUNT(diagnosis_id) DESC")
                  .limit(10)
                  .count

    get_consults
  end

  def get_exams
    @month = Date.current.beginning_of_month
    if params["month(1i)"].present?
      @month = Date.new(params["month(1i)"].to_i, params["month(2i)"].to_i)
    end
    @exams = Soap.where(created_at: @month..@month.end_of_month)
                  .group(:exams)
                  .order("COUNT(exams) DESC")
                  .limit(5)
                  .count
  end

  def get_complaints
    @month = Date.current.beginning_of_month
    if params["month(1i)"].present?
      @month = Date.new(params["month(1i)"].to_i, params["month(2i)"].to_i)
    end
    @complaints = Soap.where(created_at: @month..@month.end_of_month)
                  .group(:complaint_id)
                  .order("COUNT(complaint_id) DESC")
                  .limit(5)
                  .count
  end

  def home
    get_consults
    get_diagnosis
    get_exams
    get_complaints
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

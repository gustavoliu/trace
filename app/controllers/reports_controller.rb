class ReportsController < ApplicationController

  def home
    @month = Date.current.beginning_of_month
    if params["month(1i)"].present?
      @month = Date.new(params["month(1i)"].to_i, params["month(2i)"].to_i)
    end
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

  def get_consults
    @consults_by_month = Consult.where(consult_date: @month..Date.current)
                          .group("date_trunc('month', consult_date)")
                          .count
                          .sort_by { |k,v| k }
                          .map do |month, count|
                            [month.strftime("%B %Y"), count]
                          end
  end

  def get_diagnosis

    @diagnosis = Soap.joins(consult: { soaps: :diagnosis })
                  .where("consults.consult_date" => @month..@month.end_of_month)
                  .group("diseases.formal_name") # diagnosis_id
                  .order("COUNT(diseases.formal_name) DESC")
                  .limit(8)
                  .count
  end

  def get_exams
    @exams = Soap.joins(:consult)
                  .where("consults.consult_date" => @month..@month.end_of_month)
                  .map { |soap| soap.exams }
                  .flatten
                  .each_with_object(Hash.new(0)) { |exam,counts| counts[exam] += 1 }
    # Output: hash with { exam_name (key) => exam_count (value) }
    # @exams = {
    #   "Hemograma" => 2
    # }
  end

  def get_complaints
    @complaints = Soap.joins(consult: { soaps: :complaint })
                  .where("consults.consult_date" => @month..@month.end_of_month)
                  .group("diseases.formal_name")
                  .order("COUNT(diseases.formal_name) DESC")
                  .limit(8)
                  .count
  end
end

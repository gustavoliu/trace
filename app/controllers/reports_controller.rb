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

  def home
  end


end

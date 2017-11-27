class ReportsController < ApplicationController

  def get_consults
    #TODO: selecionar quantidade de consultas por tempo
    #selecionar consultas do periodo >> como selecionar um range de datas?

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
    #TODO: selecionar quantidade de diagnosticos em um periodo de tempo
    #selecionar 10 diagnosticos mais registrados no periodo
    @consults = Consult.where(consult_date: "Fri, 24 Nov 2017")
    #@diagnosis = Soap.select([:diagnosis, consult_id: consults]).group(:created_at).first(10)


    @diagnosis = Soap.where(created_at: Time.current.beginning_of_month..Time.current.end_of_month)
                  .group(:diagnosis) # diagnosis_id
                  .order("COUNT(diagnosis) DESC")
                  .limit(3)
                  .count
    #olhar consultas e SOAPS do periodo
    #contar diagnosticos registrados
    #retornar os 10 com maior numero de registros (count)
  end


end

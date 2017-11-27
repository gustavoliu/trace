class ReportsController < ApplicationController

  def self get_consults
    #TODO: selecionar quantidade de consultas por tempo
    #selecionar consultas do periodo
    @consults = Consult.where(consult_date: selected_month)
    #contar as consultas obtidas
    return @consults.count
  end

  def self get_diagnosis
    #TODO: selecionar quantidade de diagnosticos em um periodo de tempo
    #selecionar 10 diagnosticos mais registrados no periodo
    @consults = Consult.where(consult_date: selected_month)
    @diagnosis = Soap.select([:diagnosis, consult_id: consults]).group(:created_at).first(10)
    return @diagnosis
    #olhar consultas e SOAPS do periodo
    #contar diagnosticos registrados
    #retornar os 10 com maior numero de registros (count)
  end


end

class Consult < ApplicationRecord
  belongs_to :professional
  belongs_to :patient

  enum turn: [ :Manhã, :Tarde, :Noite ]
  enum place: [ :UBS, :Domiciliar, :Outro ]
end

class Consult < ApplicationRecord
  belongs_to :professional, :patient

  enum turn: [ :Manhã, :Tarde, :Noite ]
  enum place: [ :UBS, :Domiciliar, :Outro ]
end

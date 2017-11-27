class Consult < ApplicationRecord
  belongs_to :professional
  belongs_to :patient
  has_many :soaps

  enum turn: [ :Manhã, :Tarde, :Noite ]
  enum place: [ :UBS, :Domiciliar, :Outro ]

  scope :by_month, -> (day) { where(consult_date: day.beginning_of_month..day.end_of_month) }
end

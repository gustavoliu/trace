class Consult < ApplicationRecord
  belongs_to :professional
  belongs_to :patient
  has_many :soaps, dependent: :destroy

  include PgSearch
  pg_search_scope :search_by_consult_date, against: [:consult_date]

  enum turn: [ :Manhã, :Tarde, :Noite ]
  enum place: [ :UBS, :Domiciliar, :Outro ]

  scope :by_month, -> (day) { where(consult_date: day.beginning_of_month..day.end_of_month) }
end

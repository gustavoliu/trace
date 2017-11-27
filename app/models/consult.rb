class Consult < ApplicationRecord
  belongs_to :professional
  belongs_to :patient
  has_many :soaps

  include PgSearch
  pg_search_scope :search_by_consult_date, against: [:consult_date]

  enum turn: [ :Manhã, :Tarde, :Noite ]
  enum place: [ :UBS, :Domiciliar, :Outro ]
end

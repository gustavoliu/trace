class Soap < ApplicationRecord
  belongs_to :consult

  include PgSearch
  pg_search_scope :search_by_diagnosis, against: [:diagnosis]

  EXAMS_OPTIONS = [ 'Creatinina', 'EAS', 'ECG', 'Eletroforese Hb', 'Escarro', 'Espirometria', 'Hemograma', 'Hemoglobina Glicada', 'Glicemia' ]
  REFERRING_OPTIONS = [ 'Retorno', 'Encaminhamento Grupo', 'Encaminhamento especialidade', 'NASF', 'Urgência' ]

  serialize :exams, Array
  serialize :referring, Array

  validates :diagnosis, presence: true
  # enum exams: [ :Creatinina, :EAS, :ECG, :Eletroforese_Hb, :Escarro, :Espirometria, :Hemograma, :Hemoglobina_glicada, :Glicemia ]
  # enum refering: [ :Retorno, :Encaminhamento_Grupo, :Encaminhamento_especialidade, :NASF, :Urgência ]
end


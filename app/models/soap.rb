class Soap < ApplicationRecord
  belongs_to :consult

  EXAMS_OPTIONS = [ 'Creatinina', 'EAS', 'ECG', 'Eletroforese Hb', 'Escarro', 'Espirometria', 'Hemograma', 'Hemoglobina Glicada', 'Glicemia' ]

  serialize :exams, Array
  serialize :referring, Array


  # enum exams: [ :Creatinina, :EAS, :ECG, :Eletroforese_Hb, :Escarro, :Espirometria, :Hemograma, :Hemoglobina_glicada, :Glicemia ]
  # enum refering: [ :Retorno, :Encaminhamento_Grupo, :Encaminhamento_especialidade, :NASF, :Urgência ]
end


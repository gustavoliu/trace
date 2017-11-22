class Soap < ApplicationRecord
  belongs_to :consult

  enum exams: [ :Creatinina, :EAS, :ECG, :Eletroforese_Hb, :Escarro, :Espirometria, :Hemograma, :Hemoglobina_glicada, :Glicemia ]
  enum refering: [ :Retorno, :Encaminhamento_Grupo, :Encaminhamento_especialidade, :NASF, :Urgência ]
end


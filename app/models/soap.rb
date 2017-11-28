class Soap < ApplicationRecord
  belongs_to :consult
  belongs_to :complaint, class_name: 'Disease'
  belongs_to :diagnosis, class_name: 'Disease'

  include PgSearch
  pg_search_scope :search_by_diagnosis, against: [:diagnosis]

  serialize :exams, Array
  serialize :referring, Array

  validates :diagnosis, presence: true

  EXAMS_OPTIONS = [ 'Creatinina', 'EAS / Urina tipo I', 'ECG - Eletrocardiograma', 'Eletroforese Hb', 'Escarro', 'Espirometria', 'Hemograma', 'Hemoglobina Glicada', 'Glicemia' ]
  GROUPED_EXAMS_OPTIONS = [
    [
      "Diabetes",
      ["Glicose", "Hemoglobina"]
    ]
  ]
  REFERRING_OPTIONS = [ 'Alta do episódio', 'Retorno', 'Encaminhamento Grupo', 'Encaminhamento especialidade', 'NASF', 'Urgência' ]
  GROUPED_REFERRING_OPTIONS = [
    ["Alta do episódio", ["Alta do episódio"]],
    [
      "Retorno",
      ["Retorno para consulta agendada", "Retorno p/ cuidado continuado/programado"]
    ],
    [
      "NASF / Grupos",
      ["NASF: Educação Física", "NASF: Fisioterapia", "NASF: Fonoaudiologia",
        "NASF: Nutrição", "NASF: Pediatria",
        "NASF: Psicologia", "NASF: Psiquiatria", "NASF: Terapia Ocupacional",
        "NASF: Outras categorias profissionais",
        "Agendamento para Grupos"]
    ],
    [
      "Encaminhamentos",
      [
        "Encaminhamento p/ Urgência", "Encaminhamento p/ Internação Hospitalar",
        "Encaminhamento p/ CAPS", "Encaminhamento p/ Serviço de Atenção Domiciliar"]
      ],
    [
      "Encaminhamentos p/ serviço especializado",
      ["Cardiologia", "Cirurgia Geral", "Cirurgia Vascular", "Dermatologia",
        "Endocrionologia", "Fisioterapia", "Fonoaudiologia", "Gastroenterologia",
        "Geriatria", "Ginecologia", "Hematologia", "Infectologia", "Neurocirugia",
        "Neurologia Clínica",
        "Ortopedia", "Otorrinolaringologia", "Pneumologia", "Psiquiatria",
        "Reumatologia", "Urologia", "Encaminhamento p/ outro serviço especializado"]
    ]
  ]

  # enum exams: [ :Creatinina, :EAS, :ECG, :Eletroforese_Hb, :Escarro, :Espirometria, :Hemograma, :Hemoglobina_glicada, :Glicemia ]
  # enum refering: [ :Retorno, :Encaminhamento_Grupo, :Encaminhamento_especialidade, :NASF, :Urgência ]

end


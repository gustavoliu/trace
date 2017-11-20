class Patient < ApplicationRecord

  has_many :consults
  enum gender: [ :Masculino, :Feminino, :Outros ]

end

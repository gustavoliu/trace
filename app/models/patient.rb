class Patient < ApplicationRecord
  enum gender: [ :Masculino, :Feminino, :Outros ]

end

class Patient < ApplicationRecord

  has_many :consults
  enum gender: [ :Masculino, :Feminino, :Outros ]

  def age
    if birthday == nil
      'Idade desconhecida'
    else
      age = Date.today.year - self.birthday.year
      age -= 1 if Date.today < self.birthday + age.years
      age
    end
  end
end

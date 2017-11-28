class Patient < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_full_name, against: [:full_name, :sus_number]
  geocoded_by :address

  before_save :titleize_name
  before_create :titleize_name

  after_validation :geocode, if: :address_changed?
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

  def titleize_name
     self.full_name = self.full_name.titleize
  end
end

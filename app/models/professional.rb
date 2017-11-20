class Professional < ApplicationRecord
  belongs_to :user
  has_many :consults  
  validates :full_name, :profession, :birthday, :professional_number, presence: true, on: :update
end

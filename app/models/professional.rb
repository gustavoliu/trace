class Professional < ApplicationRecord
  belongs_to :user
  validates :full_name, :profession, :birthday, :professional_number, presence: true, on: :update
end

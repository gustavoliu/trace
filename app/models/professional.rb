class Professional < ApplicationRecord
  belongs_to :user
  has_attachment :photo
  validates: :full_name, :profession, :birthday, :professional_number presence: true
end

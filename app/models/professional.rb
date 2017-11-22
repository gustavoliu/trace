class Professional < ApplicationRecord
  belongs_to :user


  has_attachment :photo
  has_many :consults
  validates :full_name, :profession, :birthday, :professional_number, presence: true, on: :update

  def completed?
    full_name.present? && profession.present? && birthday.present? && professional_number.present?
  end
end

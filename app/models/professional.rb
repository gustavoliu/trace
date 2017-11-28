class Professional < ApplicationRecord
  belongs_to :user


  has_attachment :photo
  has_many :consults
  has_many :patients, through: :consults
  validates :full_name, :profession, :birthday, :professional_number, presence: true, on: :update

  def completed?
    full_name.present? && profession.present? && birthday.present? && professional_number.present?
  end

  def has_photo(photo)
    if
      self.photo != nil
      cl_image_tag(@professional.photo.path)
    else
      nil
    end
  end
end

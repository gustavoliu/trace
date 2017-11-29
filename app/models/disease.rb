class Disease < ApplicationRecord
  has_many :soaps
  has_many :patient_problems

  def ciap_and_description()
    "#{self.ciap_code} - #{self.formal_name}"
  end
end

class Disease < ApplicationRecord
  belongs_to :soap
  belongs_to :patient_problems

  def ciap_and_description()
    "#{self.ciap_code} - #{self.formal_name}"
  end
end

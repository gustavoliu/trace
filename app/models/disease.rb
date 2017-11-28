class Disease < ApplicationRecord
  belongs_to :soap
  belongs_to :patient_problems
end

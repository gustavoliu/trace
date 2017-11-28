class PatientProblem < ApplicationRecord
  belongs_to :patient
  belongs_to :disease
end

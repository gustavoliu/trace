class AddComplaintAndDiagnosisToSoaps < ActiveRecord::Migration[5.1]
  def change
    add_reference :soaps, :complaint, foreign_key: { to_table: 'diseases' }
    add_reference :soaps, :diagnosis, foreign_key: { to_table: 'diseases' }
  end
end

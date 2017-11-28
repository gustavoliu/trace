class RemoveComplaintAndDiagnosisFromSoaps < ActiveRecord::Migration[5.1]
  def change
    remove_column :soaps, :complaint, :string
    remove_column :soaps, :diagnosis, :string
  end
end

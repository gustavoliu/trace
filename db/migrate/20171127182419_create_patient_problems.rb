class CreatePatientProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :patient_problems do |t|
      t.references :patient, foreign_key: true
      t.references :disease, foreign_key: true
      t.text :comment
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

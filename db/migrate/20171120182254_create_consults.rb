class CreateConsults < ActiveRecord::Migration[5.1]
  def change
    create_table :consults do |t|
      t.date :consult_date
      t.string :turn
      t.string :unit_cnes
      t.string :team_number
      t.string :place
      t.integer :professional_id
      t.integer :patient_id
    end
  end
end

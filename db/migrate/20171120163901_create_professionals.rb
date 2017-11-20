class CreateProfessionals < ActiveRecord::Migration[5.1]
  def change
    create_table :professionals do |t|
      t.string :full_name
      t.string :professional_number
      t.string :photo
      t.date :birthday
      t.string :profession
      t.string :sus_number

      t.timestamps
    end
  end
end

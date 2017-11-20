class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :full_name
      t.date :birthday
      t.string :sus_number
      t.string :gender
      t.string :address
      t.string :prontuario_number

      t.timestamps
    end
  end
end

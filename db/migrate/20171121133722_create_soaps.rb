class CreateSoaps < ActiveRecord::Migration[5.1]
  def change
    create_table :soaps do |t|
      t.string :complaint
      t.string :diagnosis
      t.string :exams
      t.string :refering
      t.string :consult_id

      t.timestamps
    end
  end
end

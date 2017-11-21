class CreateDiseases < ActiveRecord::Migration[5.1]
  def change
    create_table :diseases do |t|
      t.string :ciap_code
      t.string :formal_name
      t.string :pop_name

      t.timestamps
    end
  end
end

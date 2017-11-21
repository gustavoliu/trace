class ChangeTypesOfSoaps < ActiveRecord::Migration[5.1]
  def change
    remove_column :soaps, :place
    remove_column :soaps, :turn

    add_column :soaps, :exams, :integer
    add_column :soaps, :refering, :integer
  end
end

class ChangeColumnsOfSoaps < ActiveRecord::Migration[5.1]
  def change
    remove_column :soaps, :exams
    remove_column :soaps, :refering

    add_column :soaps, :place, :integer
    add_column :soaps, :turn, :integer
  end
end

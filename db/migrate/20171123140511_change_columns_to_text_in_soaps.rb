class ChangeColumnsToTextInSoaps < ActiveRecord::Migration[5.1]
  def change
    remove_column :soaps, :exams
    remove_column :soaps, :refering

    add_column :soaps, :exams, :text
    add_column :soaps, :referring, :text
  end
end

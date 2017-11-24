class ChangeColumnsOfPatients < ActiveRecord::Migration[5.1]
  def change
    remove_column :patients, :gender

    add_column :patients, :gender, :integer
  end
end

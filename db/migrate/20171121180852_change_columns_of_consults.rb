class ChangeColumnsOfConsults < ActiveRecord::Migration[5.1]
  def change
    remove_column :consults, :place, :integer
    remove_column :consults, :turn, :integer

    add_column :consults, :place, :integer
    add_column :consults, :turn, :integer
  end
end

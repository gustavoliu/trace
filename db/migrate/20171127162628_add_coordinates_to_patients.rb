class AddCoordinatesToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :latitude, :float
    add_column :patients, :longitude, :float
  end
end

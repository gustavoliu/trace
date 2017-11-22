class AddCnesAndTeamnumberToProfessionals < ActiveRecord::Migration[5.1]
  def change
    add_column :professionals, :unit_cnes, :string
    add_column :professionals, :team_number, :string
  end
end

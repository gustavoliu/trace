class AddIsDiagnosisToDiseases < ActiveRecord::Migration[5.1]
  def change
    add_column :diseases, :is_diagnosis, :boolean
  end
end

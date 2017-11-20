class ChangeDateOnConsult < ActiveRecord::Migration[5.1]
  def change
    rename_column :consults, :date, :consult_date
  end
end

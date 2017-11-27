class DropReportsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :reports
  end
end

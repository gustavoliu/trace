class AddConsultReferenceToSoap < ActiveRecord::Migration[5.1]
  def change
    remove_column :soaps, :consult_id, :string
    add_reference :soaps, :consult, foreign_key: true
  end
end

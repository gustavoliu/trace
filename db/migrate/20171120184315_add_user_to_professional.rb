class AddUserToProfessional < ActiveRecord::Migration[5.1]
  def change
    add_reference :professionals, :user, foreign_key: true
  end
end

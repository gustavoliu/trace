class AddGooglePhotoToProfessionals < ActiveRecord::Migration[5.1]
  def change
    add_column :professionals, :google_photo, :string
  end
end

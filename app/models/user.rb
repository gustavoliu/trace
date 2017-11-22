class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_one :professional
  after_create :create_professional

  # For Google OmniAuth:
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end

    if user.professional.full_name.blank?
      # DANGEROUS! The 'update_atribute' method below overrides validations.
      user.professional.update_attribute(:full_name, "#{data.first_name} #{data.last_name}")
    end
    # professional.google_photo = data.image
    user
  end

  private

  def create_professional
    professional = Professional.new
    professional.user = self
    professional.save
  end

  def self.get_users_name_from_google_oauth(first_name, last_name)
    if last_name.nil? && first_name.nil?
      full_name = ""
    elsif last_name.nil?
      full_name = first_name
    elsif first_name.nil?
      full_name = last_name
    else
      full_name = first_name + " " + last_name
    end
    full_name
  end
end

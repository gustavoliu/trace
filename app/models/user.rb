class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :professional
  after_create :create_professional

  # def google authentication
  #TODO:incluir google auth code
  #end


  private

  def create_professional
    professional = Professional.new
    professional.user = self
    professional.save
  end
end

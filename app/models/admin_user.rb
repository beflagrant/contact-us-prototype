class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :database_authenticatable, :registerable,
  # :recoverable, :rememberable, :validatable,
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless email =~ /@flagrant.dev\z/
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url)
      .find_or_create_by!(email: email)
  end
end

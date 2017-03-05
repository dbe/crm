class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:google_oauth2]


  def self.from_omniauth(auth)
    u = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid

        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
    end 

    if u.token != auth.credentials.token
      u.token = auth.credentials.token
      u.refresh_token = auth.credentials.refresh_token
      u.save
    end

    return u
  end

  def contacts
    @contacts = @contacts || fetch_contacts()
  end

  def fetch_contacts
    client = OAuth2::Client.new(ENV["CRM_GOOGLE_CLIENT_ID"], ENV["CRM_GOOGLE_CLIENT_SECRET"], {:site => {:ssl => {:verify => false}}})
    token = OAuth2::AccessToken.new(client, self.token)

    g_user = GoogleContactsApi::User.new(token)
    return g_user.contacts("max-results" => 10)
  end
end

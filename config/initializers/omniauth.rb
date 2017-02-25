Rails.application.config.middleware.use OmniAuth::Builder do
    OmniAuth.config.full_host = Rails.env.production? ? 'https://changeme.com' : 'http://localhost:3000'

    provider OmniAuth::Strategies::GoogleOauth2, ENV["CRM_GOOGLE_CLIENT_ID"], ENV["CRM_GOOGLE_CLIENT_SECRET"],
      {
        :scope => "email, profile, plus.me, https://www.google.com/m8/feeds/",
        :client_options => { :ssl => { :verify => !Rails.env.development? } }
      }
end

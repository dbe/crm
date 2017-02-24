Rails.application.config.middleware.use OmniAuth::Builder do
    provider OmniAuth::Strategies::GoogleOauth2, ENV["CRM_GOOGLE_CLIENT_ID"], ENV["CRM_GOOGLE_CLIENT_SECRET"],
      {
        :scope => "https://www.google.com/m8/feeds/"
      }
end

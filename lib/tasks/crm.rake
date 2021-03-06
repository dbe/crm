namespace :crm do

  desc "OREO"
  task oreo: :environment do
    client = OAuth2::Client.new(ENV["CRM_GOOGLE_CLIENT_ID"], ENV["CRM_GOOGLE_CLIENT_SECRET"], {:site => {:ssl => {:verify => false}}})
    token = OAuth2::AccessToken.new(client, User.first.token)

    g_user = GoogleContactsApi::User.new(token)
    contacts = g_user.contacts
    puts contacts

    contacts.each do |contact|
      puts contact.inspect
    end
  end

end

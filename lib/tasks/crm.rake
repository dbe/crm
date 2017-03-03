namespace :crm do

  desc "OREO"
  task oreo: :environment do
    user = User.first
    g_user = GoogleContactsApi::User.new(user.token)
    contacts = g_user.contacts
    puts contacts
  end

end

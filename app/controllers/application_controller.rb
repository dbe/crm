class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :oreo

  def oreo
    puts "OREO"
    puts request.env['omniauth.auth']
  end
end

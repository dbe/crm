class HomeController < ApplicationController
  def index
    if user_signed_in?
      @contacts = current_user.contacts

      #TODO: This is a bit hacky. It is here to get rid of the "contactSet that the library uses and put it into an array"
      @contacts = @contacts.map {|i| i}
    end
  end
end

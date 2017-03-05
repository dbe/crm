Rails.application.routes.draw do
  resources :contacts
  root to: 'home#index'
  get 'home/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
end

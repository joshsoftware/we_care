Rails.application.routes.draw do
  root 'home#index'

  get '/homes', to: 'home#index'
end

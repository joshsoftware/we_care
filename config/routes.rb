Rails.application.routes.draw do
  root 'home#index'

  get '/homes', to: 'home#index'
  resources :auction_items, only: [:show]
  resources :bids, only: [:create]
end

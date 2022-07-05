Rails.application.routes.draw do
  resources :dislikes
  resources :likes
  resources :channel_members
  resources :channel_owners
  resources :channels
  resources :post
  resources :users

  get "/me" to: "users#show"

  get 'sessions/create'
  get 'sessions/delete'

  get '/hello', to: 'application#hello_world'
end

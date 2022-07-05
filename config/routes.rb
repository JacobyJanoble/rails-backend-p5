Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/delete'

  resources :dislikes
  resources :likes
  resources :channel_members
  resources :channel_owners
  resources :channels
  resources :post
  resources :users

  post '/login', to: 'sessions#create'
  # post '/unlike_like', to: 'sessions#create'
  # post '/undislike_like' to: 'sessions#create'


  get '/hello', to: 'application#hello_world'
end

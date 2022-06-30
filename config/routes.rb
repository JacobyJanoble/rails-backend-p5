Rails.application.routes.draw do
  resources :dislikes
  resources :channel_members
  resources :channel_owners
  resources :channels
  resources :posts
  resources :likes
  resources :users

  get '/hello', to: 'application#hello_world'
end

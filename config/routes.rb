Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/delete'

  resources :dislikes
  resources :likes
  resources :channel_members
  resources :channel_owners
  resources :channels
  resources :posts
  resources :users


  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users', to: "users#show"

  get '/posts', to: 'posts#show'

  get '/contact', to: 'contact#new'
  get '/contact', to: 'contact#create'


  get '/hello', to: 'application#hello_world'
end

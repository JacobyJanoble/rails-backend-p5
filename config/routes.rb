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

    post '/unlike_like', to: 'dislikes#unlike_like'
    post '/unlike_dislike', to: 'dislikes#unlike_dislike'
    post '/undislike_like', to: 'likes#undislike_like'


    get '/hello', to: 'application#hello_world'
end

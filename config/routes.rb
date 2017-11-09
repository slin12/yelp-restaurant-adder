Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :restaurants, only: [:index, :create]
  resources :sessions, only: [:create]

  get '/search', to: 'searches#new'

  post '/results', to: 'searches#results'

  post '/restaurants', to: 'restaurants#create'

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  root to: 'users#new'
end

Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # resources :users

  # resources :sessions, only: [:new, :create, :destroy]
  # get '/signup', to: 'users#new', as: 'signup'
  # get '/login', to: 'sessions#new', as: 'login'
  # get '/logout', to: 'sessions#destroy', as: 'logout'
  # namespace :api do
  #   namespace :v1 do
  #     resources :users, only: [:create]
  #     post '/login', to: 'auth#create'
  #     get '/profile', to: 'users#profile'
  #     end
  # end
  resources :users, only: [:show, :create, :update]
  resources :posts
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/posts', to: 'users#posts'
  get '/data/:id', to: 'posts#eeg' 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

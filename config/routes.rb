Rails.application.routes.draw do
  root 'projects#index'

  resources :projects
  resources :tags, except: :show
  resources :tickets do
    resources :comments, only: %i[create edit update destroy]
  end

  post '/users', to: 'users#create'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end

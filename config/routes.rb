Rails.application.routes.draw do
  root 'projects#index'

  resources :projects
  resources :tickets
  resources :tags, except: :show

  post '/users', to: 'users#create'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end

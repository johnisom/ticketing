Rails.application.routes.draw do
  root 'projects#index'

  resources :projects
  resources :tickets
  resources :tags, except: :show

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
end

Rails.application.routes.draw do
  #http   location    controller#method  alias
  get '/herbs', to: 'herb#index', as: 'herbs'
  get '/herbs/new', to: 'herb#new', as: 'herb_new'
  get '/herbs/:id', to: 'herb#show', as: 'herb'
  post '/herbs', to: 'herb#create'
  get '/herbs/:id/edit', to: 'herb#edit', as: 'edit_herb'
  patch 'herbs/:id', to: 'herb#update'
  delete '/herbs/:id', to: 'herb#destroy', as: 'delete_herb'
  root 'herb#index'
end

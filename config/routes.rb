Rails.application.routes.draw do
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  resources :users, only: [:new,:create]
  get '/', to:"welcome#index"
  post '/logout', to:'sessions#destroy'
end

Rails.application.routes.draw do
  
  resources :users, only: [:new, :create]
  
  root 'users#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

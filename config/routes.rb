Rails.application.routes.draw do
  resources :users do
    resources :opinions
  end

  resources :sessions, only: [ :new, :create, :destroy ]

  get '/sign_up', to: 'users#new'
  get '/home', to: 'opinions#index'

  resources :followings

  root 'sessions#new'
  
end

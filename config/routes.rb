Rails.application.routes.draw do
  resources :users do
    resources :opinions
  end

  post '/sign_in', to: 'users#create'
  get '/home', to: 'users#show'

  resources :followings

  root 'sessions#create'
  
end

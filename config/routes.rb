Rails.application.routes.draw do
  resources :users do
    resources :opinions
  end

  post '/sign_in', to: 'user#create'
  get '/home', to: 'user#show'

  resources :followings
  
end

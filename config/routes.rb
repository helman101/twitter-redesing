Rails.application.routes.draw do
  resources :users do
    resources :opinions
  end

  resources :followings
  
end

Rails.application.routes.draw do
  devise_for :users
  root 'cars#index'

  get 'about' => 'pages#about'
  get 'mycar' => 'pages#mycar'

  namespace :users do
    resources :cars
  end

  
  resources :cars do
    resources :comments
  end

end

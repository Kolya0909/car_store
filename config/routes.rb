Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users
  root 'cars#index'

  get 'about' => 'pages#about'
  get 'mycar' => 'pages#mycar'
  get 'homepage' => 'pages#homepage'

  namespace :users do
    resources :cars
  end

  resources :cars do
    resources :comments
  end
  


end

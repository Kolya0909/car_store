Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users do
    resources :cars
    resources :messages
  end
  root 'cars#index'

  get 'about' => 'pages#about'
  get 'mycar' => 'pages#mycar'
  get 'homepage' => 'pages#homepage'


  resources :cars do
    resources :comments
  end
  


end

Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users, only: [:edit, :update, :show, :destory] do
    resources :cars
    resources :messages
  end
  root 'cars#index'

  get 'about' => 'pages#about'
  get 'mycar' => 'pages#mycar'
  get 'homepage' => 'pages#homepage'
  get 'mymessage' => 'pages#mymessage'


  resources :cars do
    resources :comments
  end
  


end

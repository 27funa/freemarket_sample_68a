Rails.application.routes.draw do
  get 'buys/index'
  get 'delivery_/informations'
  root 'posts#index'

  resources :accounts, only: :index
  resources :profiles, only: :index
  resources :user_informations, only: :index
  resources :delivery_informations, only: :index

end

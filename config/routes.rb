Rails.application.routes.draw do

  devise_for :users
  get 'buys/index'
  get 'logouts/index'
  root 'posts#index'

  resources :posts
  resources :accounts, only: :index
  resources :profiles, only: :index
  resources :user_informations, only: :index
  resources :delivery_informations, only: :index
  resources :osawas, only: :index

  resources :images,only: [:create]
end

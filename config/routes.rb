Rails.application.routes.draw do

  devise_for :users,controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions',
  }

  get 'buys/index'
  get 'logouts/index'
  root 'posts#index'



  resources :posts
  resources :buys, only: [:index, :destroy]
  resources :profiles
  resources :user_informations
  resources :delivery_informations
  resources :osawas, only: :index
  resources :credits, except: [:show, :edit, :update]
  resources :categories, only: [:index, :new]
  resources :buy_credit, except: [:show, :edit, :update]


  resources :images,only: [:create]
end

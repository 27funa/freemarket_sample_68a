Rails.application.routes.draw do

  devise_for :users,controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions',
  }

  root 'posts#index'
  # post "posts/:id/destroy" => "posts#destroy"
  

  resources :posts do
    resources :buys
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' } 
    end
  end 


    # get 'get_category_children/index', defaults: { format: 'json' }
    # get 'get_category_grandchildren/index', defaults: { format: 'json' }
 
  # resources :posts, only: [:destroy]
  get 'logouts/index'
  
  resources :profiles
  resources :user_informations
  resources :delivery_informations
  resources :buys_deli
  resources :osawas, only: :index
  resources :credits, except: [:show, :edit, :update]
  resources :categories, only: [:index, :new]

  resources :images,only: [:create]
end

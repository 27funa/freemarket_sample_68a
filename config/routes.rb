Rails.application.routes.draw do

  devise_for :users,controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions',
  }

  get 'buys/index'
  get 'logouts/index'
  root 'posts#index'
  # post "posts/:id/destroy" => "posts#destroy"
  


  resources :buys, only: [:index, :destroy]
  
  resources :posts do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end 


    # get 'get_category_children/index', defaults: { format: 'json' }
    # get 'get_category_grandchildren/index', defaults: { format: 'json' }
 
  # resources :posts, only: [:destroy]
  resources :profiles
  resources :user_informations
  resources :delivery_informations
  resources :osawas, only: :index
  resources :credits, except: [:show, :edit, :update]
  resources :buy_credit, except: [:show, :edit, :update]

  resources :categories, only: [:index, :new,] do
    member do
      get 'parent'
      get 'child'
      get 'grandchild'
    end
  end

  resources :images,only: [:create]
end

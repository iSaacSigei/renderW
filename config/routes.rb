Rails.application.routes.draw do
  resources :tenders do
    collection do
      patch 'update_category'
    end
  end
  resources :jobs, only: [:index, :show, :create, :update, :destroy]
  post '/signup', to: 'users#create'
  post 'login', to: 'sessions#login'
  get 'user', to: 'sessions#show'
  
  # Existing users resource route
  resources :users, only: [:index, :create, :update, :destroy] do
    # New routes for user profile and password management
    member do
      get 'profile'          # For getting user profile
      patch 'update_profile' # For updating user profile
      patch 'update_password' # For updating user password
    end
  end
  
  resources :export_orders, only: [:create, :index, :show]
  resources :import_orders, only: [:create, :index, :show]
  resources :quotations, only: [:index, :create, :show]
  resources :contact_messages, only: [:create, :index, :destroy]
  resources :events
end

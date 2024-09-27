Rails.application.routes.draw do
  resources :tenders do
    collection do
      patch 'update_category'
    end
  end

  resources :jobs, only: [:index, :show, :create, :update, :destroy]
  
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#login'
  get '/user', to: 'sessions#show'
  get '/users/profile', to: 'users#show_profile'

  resources :users, only: [:create, :destroy, :index] do
    member do
      patch 'update_profile'
      patch 'update_password'
    end
  end
  
  resources :export_orders, only: [:create, :index, :show]
  resources :import_orders, only: [:create, :index, :show]
  resources :quotations, only: [:index, :create, :show]
  resources :contact_messages, only: [:create, :index, :destroy]
  resources :events
end

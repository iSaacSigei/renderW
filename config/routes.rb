Rails.application.routes.draw do
  post '/signup', to: 'users#create'
  post 'login', to: 'sessions#login'
  get 'user', to: 'sessions#show'  # Add this line
  resources :users, only: [:create, :update, :destroy, :index]
  resources :export_orders, only: [:create, :index, :show]
  resources :import_orders, only: [:create, :index, :show]
  resources :quotations, only: [:index, :create, :show]
end

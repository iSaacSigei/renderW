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
  resources :users, only: [:create, :update, :destroy, :index]
  resources :export_orders, only: [:create, :index, :show]
  resources :import_orders, only: [:create, :index, :show]
  resources :quotations, only: [:index, :create, :show]
  resources :contact_messages, only: [:create, :index]
  resources :events
end

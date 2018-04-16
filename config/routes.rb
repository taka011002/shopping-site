Rails.application.routes.draw do
  root'static_pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'admin' => 'admins#admin'
  get 'admin/user' => 'users#admin_user'
  post 'admin/user' => 'users#admin_destroy'
  post 'admin/create' => 'users#admin_create'
  get 'admin/product' => 'products#admin_index'
  get 'admin/order' => 'orders#admin_index'
  resources :users do
    collection do
      get :orders
    end
  end
  resources :products
  resources :cart_items, only: [:index, :create, :destroy]
  resources :orders ,only: [:index, :create, :destroy, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

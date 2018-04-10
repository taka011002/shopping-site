Rails.application.routes.draw do
  root'static_pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'admin' => 'users#admin'
  get 'admin/user' => 'admins#user'
  get 'admin/product' => 'admins#product'
  get 'admin/order' => 'admins#order'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

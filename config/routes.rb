Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'products#index'
    devise_for :admins
    devise_for :end_users
  namespace :admin do
    resources :end_users, only: [:index, :show, :edit, :update, :destroy]
    resources :order_details, only: [:show, :edit]
    resources :orders, only: [:index, :show]
    resources :products, only: [:index, :show, :new, :edit]
    resources :arrivals, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :artists, only: [:new, :edit, :create, :update, :destroy]
    resources :labels, only: [:new, :edit, :create, :update, :destroy]
    resources :genres, only: [:new, :edit, :create, :update, :destroy]
    get  'top' => 'home#top'
    get  'out' => 'end_users#out'
    get  'change' => 'order_details#change'
  end   
  resources :end_users, only: [:show, :edit, :destroy, :update] do 
    resources :addresses, only: [:create]
  end
  resources :orders, only: [:index, :show]
  resources :order_details, only: [:index]
  resources :cart_products, only: [:edit, :new, :show, :update, :destroy]
  resources :products, only: [:index, :show]
  get  'out' => 'end_users#out'
end

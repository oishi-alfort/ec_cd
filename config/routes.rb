Rails.application.routes.draw do

 
  #chiharu
  resources :inquiries
 
  resources :artists, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :labels, only: [:create, :update, :index, :show, :destroy]
  resources :categories, only: [:create, :index, :show]
  resources :cds do


    #ryo
    resources :disc_numbers,only:[:new, :edit, :create, :update, :destroy] do
      resources :songs,only:[:new, :edit, :create, :update, :destroy]
    end
    #/ryo

    resources :comments, only: [:create, :update], shallow: true do
      resources :comment_replies, only: [:create, :update, :destroy]
    end
    resource :favorite, only: [:create, :destroy]
  end

  # resources :cart_items, only: [:create, :update, :destroy]

  delete 'cd/:id/comments/:id', to: 'comments#destroy', as: 'cd_comment'

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end
  resources :pickups, only: [:new, :create, :edit, :update, :show, :destroy]
  get '/search', to: 'searches#result', as: :search

  post '/omise' => "orders#omise"


  #ryo
  root :to => "root#top"
  get '/about' => 'root#about',as: 'about'
  get '/checkout' => 'orders#checkout',as: 'checkout'
  # Chiharu
  get '/payment' => 'orders#payment',as: 'payment'
  get '/status/:id' => 'orders#status',as: 'status'
  get '/status_edit/:id' => 'orders#status_edit',as: 'status_edit'

  get '/confirmation' => 'orders#confirmation',as: 'confirmation'
  resources :cart_items, only:[:create, :update, :destroy]
  get '/cart' => 'carts#cart',as: 'cart'
  post '/add_item' => 'carts#add_item', as: 'add_item'
  post '/update_item' => 'carts#update_item',as: 'update_item'
  delete '/delete_item' => 'carts#delete_item', as: 'delete_item'
  post '/cds/item' => 'cds#create_item',as: 'create_item'
  resources :orders, only: [:create, :edit, :update]

  # get 'categories/index'
  # get 'categories/show'
  # get 'labels/index'
  # get 'cds/new'
  # get 'cds/index'
  # get 'cds/show'
  # get 'cds/edit'
  # get 'artists/new'
  # get 'artists/edit'
  # get 'artists/show'
  
  #kazumi
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
} 
  resources :users, only: [:edit, :update, :index, :show, :destroy]
  devise_scope :user do
    get "user/:id", :to => "users#show"
    get "signup", :to => "users/registrations#new"
    get "users/edit", :to => "users/registrations#edit"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
end
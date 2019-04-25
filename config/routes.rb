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

  delete 'cd/:id/comments/:id', to: 'comments#destroy', as: 'cd_comment'

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end
  resources :pickups, only: [:new, :create, :edit, :update, :show, :destroy]
  get '/search', to: 'searches#result', as: :search


  #ryo
  root :to => "root#top"
  get '/about' => 'root#about',as: 'about'
  get '/checkout' => 'orders#checkout',as: 'checkout'
  get '/confirmation' => 'orders#confirmation',as: 'confirmation'

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
  resources :users
  devise_scope :user do
    get "user/:id", :to => "users#show"
    get "signup", :to => "users/registrations#new"
    get "users/edit", :to => "users/registrations#edit"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
end
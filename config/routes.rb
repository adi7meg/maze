Rails.application.routes.draw do

  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'


  # get 'users/index'
  devise_for :users

  resources :users, only: [:index] do
    collection{ post :import}
    get '/new', to: "users#new"
    post '/new', to: "users#create" , as:'user_create'
    # get '/upload', to: "users#import", as: 'upload_user'
    member do
      get :confirm_email
    end

    member do
      patch :ban
    end
  end
  root "articles#index"

  resources :articles do
    resources :comments
    resources :likes,only: [:create, :destroy]

    # match '/users', to: 'users#index', via: 'get'
  end
  get '/upload_users', to: "users#import_page", as: 'upload_user_page'

end

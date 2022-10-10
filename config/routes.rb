Rails.application.routes.draw do
  # get 'users/index'
  devise_for :users

  resources :users, only: [:index] do
    get '/new', to: "users#new"
    post '/new', to: "users#create" , as:'user_create'

    collection { post :import}
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

end

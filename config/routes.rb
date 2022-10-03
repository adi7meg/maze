Rails.application.routes.draw do
  # get 'users/index'
  devise_for :users

  resources :users, only: [:index] do
    member do
      patch :ban
    end
  end
  root "articles#index"

  resources :articles do
    resources :comments

    # match '/users', to: 'users#index', via: 'get'
  end

end

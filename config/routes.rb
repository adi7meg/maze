Rails.application.routes.draw do

  root "articles#index"

  # get "/articles", to: "articles#index"
  # get "/art/:id", to: "articles#show"
  resources :articles do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

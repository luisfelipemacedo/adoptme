Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pets do
    resources :adoptions, only: %i[new create]
  end
  resources :adoptions, only: %i[update destroy]
  # Defines the root path route ("/")
  # root "articles#index"
  get "users/:id", to: "profiles#show", as: "profile"
  get "aboutus", to: "profiles#display", as: "aboutus"
end

Rails.application.routes.draw do

  root to: "site#index"

  get "/signup", to: "users#new", as: :signup
  get "/profile", to: "users#show", as: :profile

  get "/login", to: "sessions#new", as: :login
  get "/logout", to: "sessions#destroy", as: :logout

  resources :users, only: [:create] do
    resources :questions, only: [:index, :new, :create, :show]
  end
  resources :sessions, only: [:create]
<<<<<<< HEAD
  resources :questions, only: [:new, :create, :update, :delete] do
    resources :answers
  end
=======
  resources :answers

>>>>>>> cea287d7c97b09510a835ac4ee749603d62ebb95
end

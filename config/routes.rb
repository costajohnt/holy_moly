Rails.application.routes.draw do

  root to: "site#index"

  get "/signup", to: "users#new", as: :signup
  get "/profile", to: "users#show", as: :profile

  get "/login", to: "sessions#new", as: :login
  get "/logout", to: "sessions#destroy", as: :logout

  resources :users, only: [:create]
  resources :sessions, only: [:create]
<<<<<<< HEAD
  resources :answers
  resources :questions
=======
  resources :questions, only: [:new, :create]
>>>>>>> e23c357e86a88d8e00888ee063bd9f98118bd916

end

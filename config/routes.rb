Rails.application.routes.draw do

  root to: "site#index"

  get "/signup", to: "users#new", as: :signup
  get "/profile", to: "users#show", as: :profile

  get "/login", to: "sessions#new", as: :login
  get "/logout", to: "sessions#destroy", as: :logout

  resources :users, only: [:create] do
    resources :questions, only: [:index, :new, :create, :show] do
      resources :answers do
      end
    end
  end
  resources :sessions, only: [:create]
  resources :questions, only: [:new, :create, :update, :delete]
end

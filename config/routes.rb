Rails.application.routes.draw do

  post "headshot/capture" => 'headshot#capture', :as => :headshot_capture
  root to: "site#index"

  get "/signup", to: "users#new", as: :signup
  get "/profile", to: "users#show", as: :profile

  get "/login", to: "sessions#new", as: :login
  get "/logout", to: "sessions#destroy", as: :logout

  resources :users, only: [:create] do
    resources :questions do
      resources :answers
    end
  end
  resources :sessions, only: [:create]
  namespace :nurses do
    resources :questions do
      resources :answers
    end
  end
end

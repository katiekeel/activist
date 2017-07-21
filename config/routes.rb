Rails.application.routes.draw do
  root "welcome#index"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :interests
    resources :groups
    resources :users
    resources :events
    resources :dashboard, only: [:index]
  end

  namespace :contact do
    resources :groups
    resources :events
    resources :dashboard, only: [:index]
  end

  resources :interests, only: [:index, :show]

  resources :groups, only: [:index, :show]

  resources :events, only: [:index, :show]
end

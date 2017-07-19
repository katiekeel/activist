Rails.application.routes.draw do
  root "welcome#index"

  namespace :admin do
    resources :interests
    resources :groups
    resources :users
  end

  namespace :contact do
    resources :groups do
      resources :events
    end
  end

  resources :interests, only: [:index, :show]

  resources :groups, only: [:index, :show]

  resources :events, only: [:index, :show]
end

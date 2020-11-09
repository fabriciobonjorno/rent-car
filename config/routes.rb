Rails.application.routes.draw do
  get "user/index"
  get "dashboard/index"
  root "home#index"
  namespace :dashboard do
    resources :cars, expect: %i[show]
    resources :users, expect: %i[show]
  end

  namespace :user do
    resources :reservations
    resources :clients
  end

  devise_for :clients
  devise_for :users
end

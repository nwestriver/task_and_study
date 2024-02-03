Rails.application.routes.draw do
  root "home#index"
  get "/users/:id/dashboard", to: "users#dashboard"
  resources :users
  resource :session, only: [:new, :create, :destroy]
end
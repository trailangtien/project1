Rails.application.routes.draw do
  root "static_pages#index"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  resources :users
end

Rails.application.routes.draw do
  get "/" => "home#index"
  resources :todos
  resources :users
  post "users/login"
end

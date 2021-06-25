Rails.application.routes.draw do
  get "todos", to: "todos#index"
end
Rails.application.routes.draw do
  get "todos", to: "todos#index"
  get "todos/:id", to: "todos#show"
end
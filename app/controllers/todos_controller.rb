class TodosController < ApplicationController
    def index
      render plain: "Hello, this is /todos!"
    end
  end
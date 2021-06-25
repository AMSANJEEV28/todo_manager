class TodosController < ApplicationController
    def index
      render plain: Todo.all.to_a
    end
  end
class UsersController < ApplicationController
def new
  render "users/new"
  end

  def create
    User.create!(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password],
    )
    redirect_to  "/"
  end

  def login
    email = params[:email]
    password = params[:password]
    is_user_exist = User.where(email: email, password: password).exists?
    render plain: is_user_exist
  end
end

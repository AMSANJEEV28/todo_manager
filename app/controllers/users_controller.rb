class UsersController < ApplicationController
def new
  render "users/new"
  end

  def index
    render plain: User.all.map { |user| user.to_user_list }.join("\n")
  end

  def show
    id = params[:id]
    users = User.find(id)
    render plain: users.to_user_list
  end

  def create
    User.create!(
    first_name = params[:first_name],
    last_name = params[:last_name],
    email = params[:email],
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

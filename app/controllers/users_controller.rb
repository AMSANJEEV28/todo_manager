class UsersController < ApplicationController
  def index
    render plain: User.all.map { |user| user.to_user_list }.join("\n")
  end

  def show
    id = params[:id]
    users = User.find(id)
    render plain: users.to_user_list
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]

    new_user = User.create!(
      first_name: first_name,
      last_name: last_name
      email: email,
      password_digest: password_digest,
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

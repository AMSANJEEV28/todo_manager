class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_user_list }.join("\n")
  end

  def show
    id = params[:id]
    users = User.find(id)
    render plain: users.to_user_list
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      user: name,
      email: email,
      password: password,
    )
    render plain: "Hello New User !!  Your user id is #{new_user.id} with user name #{name}"
  end

  def login
    email = params[:email]
    password = params[:password]
    is_user_exist = User.where(email: email, password: password).exists?
    render plain: is_user_exist
  end
end

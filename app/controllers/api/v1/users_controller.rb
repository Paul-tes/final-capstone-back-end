class Api::V1::UsersController < ApplicationController
  # Create a new user
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # Get a list of all users
  def index
    @users = User.all # current_user
    render json: @users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

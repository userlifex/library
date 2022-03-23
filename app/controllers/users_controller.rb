class UsersController < ApplicationController

  protect_from_forgery except: :create # this is for auth error

  def index
    users = User.where(is_active: true)
    render json: { data: users }, status: :ok
  end


  def show
    user = User.find(params[:id])
    if user.is_active
      render json: { data: user }, status: :ok
    else
      render json: { message: "User not found" }, status: :bad_request
    end
  end


  def create
    user = User.new(user_params)
    if user.save
      render json: { data: user }, status: :ok
    else
      render json: { data: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    user = User.find(params[:id])

    if user.is_active
      user.update(user_params)
      if user.save
        render json: { data: user }, status: :ok
      else
        render json: { data: user.errors.full_messages }, status: :bad_request
      end
    else 
      render json: { data: "User not found"}, status: :bad_request
    end

  end

  def destroy

    user = User.find(params[:id])

    if user.is_active
      user.is_active = false
      if user.save
        render json: { message: "The user #{user.first_name} has been deleted" }, status: :ok
      else
        render json: { data: user.errors.full_messages }, status: :bad_request
      end
    else 
      render json: { data: "User not found"}, status: :bad_request
    end
  end

  def user_params 
    params.require(:user).permit(:first_name, :last_name, :email)
  end


end

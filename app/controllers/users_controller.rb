class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    render json: @user.as_json(only: [:name], include: [:cars])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: {
        success: true,
        data: {
          logged_in: true,
          user: @user.as_json(only: %i[id name], include: [:cars])
        }
      }, status: :created, location: @user
    else
      render json: {
        success: false,
        errors: @user.errors
      }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(params[:userID]))

    if @user
      render json: {
        success: true,
        data: {
          logged_in: true,
          user: @user.as_json(only: [:name], include: [:cars])
        }
      }
    else
      render json: {
        success: false,
        errors: ['no such user, please try again']
      }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :userID, :admin_id)
  end
end
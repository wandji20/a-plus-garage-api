class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    render json: @user.as_json(only: [:name], include: [:cars])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!
      render json: {
        success: true,
        data: {
          logged_in: true,
          user: @user.as_json(only: [:id, :name], include: [:cars])
        }
      }, status: :created, location: @user
    else
      render json: {
        success: false,
        errors: @user.errors
      }, status: :unprocessable_entity
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

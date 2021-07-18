class SessionsController < ApplicationController
  def create
    @user = User.find_by(userID: session_params[:userID])

    if @user
      login!
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

  def session_params
    params.permit(:userID)
  end
end

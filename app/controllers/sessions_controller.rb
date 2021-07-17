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

  def logged_in?
    if logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user.as_json(only: [:name])
      }
    else
      render json: {
        logged_in: false,
        message: 'no such user'
      }
    end
    render json: {
      logged_in: false,
      message: 'no such user login to create account'
    }
  end

  def destroy
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
  end

  private

  def session_params
    params.permit(:userID)
  end
end

class SessionsController < ApplicationController
  def create
    @user = User.find_by(userID: session_params[:userID])
    @user
    if @user
      login!
      render json: {
        success: true,
        data: {
          logged_in: true,
          user: @user
        }
      }
    else
      render json: { 
        success: false,
        errors: ['no such user, please try again']
      }
    end
end
def is_logged_in?
    if logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user
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

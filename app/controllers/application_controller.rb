class ApplicationController < ActionController::API
  include ActionController::Helpers

  private

  def login!
    session[:user_id] = @user.id
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_user?
    @user == current_user
  end

  def logout!
    session[:user_id] = nil
  end

  def set_user
    @user = User.find_by(id: session[:user_id])
  end
  helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!, :set_user
end

class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.user_name, user.password_digest).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :user_name,
      :email,
      :password_digest,
      # :password_confirmation
    )
  end
end

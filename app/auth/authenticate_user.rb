class AuthenticateUser
  def initialize(user_name, password)
    @password = password
    @user_name = user_name
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :user_name, :password

  def user
    user = User.find_by(user_name: @user_name)
    return user if user&.authenticate(password)

    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end

class AuthenticateUser
  def initialize(userID, password)
    # @email = email
    @password = password
    @userID = userID
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :userID, :password

  # verify user credentials
  def user
    user = User.find_by(userID: userID)
    return user if user && user.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
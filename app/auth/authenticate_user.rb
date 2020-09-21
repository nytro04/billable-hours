class AuthenticateUser
    #prepend SimpleCommand
    attr_accessor :email, :password
  
    #this is where parameters are taken when the command is called
    def initialize(email, password)
      @email = email
      @password = password
    end
    
    #this is where the result gets returned
    def call
      JsonWebToken.encode(user_id: user.id) if user
    end
  
    private
  
    def user
      user = User.find_by(email: email)
      return user if user && user.authenticate(password)
  
      raise(ExceptionHandler::AuthenticationError, /#{Message.invalid_credentials}/)
    end
  end
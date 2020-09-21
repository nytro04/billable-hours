module ExceptionHandler
    extend ActiveSupport::Concern
  
    class AuthenticationError < StandardError; end
    class MissingToken < StandardError; end
    class InvalidToken < StandardError; end
    class ExpiredSignature < StandardError; end
    class DecodeError < StandardError; end
    
    included do
      rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
      rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
      rescue_from ExceptionHandler::MissingToken, with: :unauthorized_request
      rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
      rescue_from ExceptionHandler::ExpiredSignature, with: :unauthorized_request
      rescue_from ExceptionHandler::DecodeError, with: :unauthorized_request
    end
  
    private
  
    # JSON response with message; Status code 422 - unprocessable entity
    def four_twenty_two(e)
     render json: { message: e.message }, status: :unprocessable_entity
    end

  
     # JSON response with message; Status code 401 - Unauthorized
    def unauthorized_request(e)
      render json: { message: e.message }, status: :unauthorized
    end
  end
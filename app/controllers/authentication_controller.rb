# frozen_string_literal: true

class AuthenticationController < ApplicationController
  def authenticate
    user = User.find_by(email: authentication_params[:email])
    
    if user&.authenticate(authentication_params[:password])
      json_response({ data: user },200)
    else
      json_response({ message: 'Invalid username/password' }, 401)
    end
  end

  private

  def authentication_params
    params.permit(:email, :password)
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::API
    include ExceptionHandler
    include Response
    before_action :authenticate_request
    attr_reader :current_user

    private
    
    def authenticate_request
        @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end
end

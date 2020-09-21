# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.create!(user_params)
      response = { message: Message.account_created,data: user}
      json_response(response, :created) 
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :role_id,
      :password,
      :password_confirmation
    )
  end
end

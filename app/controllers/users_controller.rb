# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    # auth_token = AuthenticateUser.new(user.email, user.password).user
    response = { message: "User created successfully", data: user }
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

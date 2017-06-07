module V1
  class RegistrationController < ApplicationController
    require 'json'

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, serializer: V1::UserSerializer, status: 201
      else
        render json: { error: t('user_create_error') }, status: :unprocessable_entity
      end
    end

    private
    def user_params
      params["params"].require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :bio,
        :jump_to,
        :jump_from,
        :password,
        :password_confirmation,
        :username
      )
    end
  end
end

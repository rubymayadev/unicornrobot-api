module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:create]

    # POST /v1/users
    #  creates a user
    def create
      @user = User.new user_params

      if @user.save
        render json: @user, serializer: V1::SessionSerializer, root: nil
      else
        render json: { error: t('user_create_error') }, status: :unprocessable_entity
      end
    end

    # will need to add a delete so that admin users can delete accounts
    # also need update so that users can update their own profile information

    private

    def user_params
      params.permit(:email, :username, :password, :password_confirmation)
    end
  end
end

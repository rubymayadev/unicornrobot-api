class ApplicationController < ActionController::API
  attr_reader :current_user
  include AbstractController::Translation
  # include Response
  # include ExceptionHandler
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :authenticate_request!
  respond_to :json

  # User Authentication
  # Authenticates the user with OAUth2 Resource Owner Password
  # def authenticate_user_from_token!
  #   auth_token = request.headers['Authorization']
  #
  #   if auth_token
  #     authenticate_with_auth_token auth_token
  #   else
  #     authentication_error
  #   end
  # end

  protected

  def authenticate_request!
    unless user_id_in_token?
      render json: {errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    @current_user = User.find_by_id(auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated']}, status: :unauthorized
  end

  private

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id]
  end

  #  don't think we need the below methods as long as we have JWT

  # def authenticate_with_auth_token auth_token
  #   # will need to find better way to create the auth_token(maybe JWT)
  #   unless auth_token.include?(':')
  #     authentication_error
  #     return
  #   end
  #
  #   user_id = auth_token.split(":").first
  #   user = User.where(id: user_id).first
  #
  #   if user && Devise.secure_compare(user.access_token, auth_token)
  #     #  User can access
  #     sign_in user, store: false
  #   else
  #     authentication_error
  #   end
  # end

  ##
  # Authentication Failure
  # Renders a 401 error
  # def authentication_error
  #   # User's token is either invalid or not in the right format
  #   render json: {error: t('unauthorized')}, status: 401 # Authentication timeout
  # end
end

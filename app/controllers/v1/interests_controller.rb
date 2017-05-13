module V1
  class InterestsController < ApplicationController
    def create
      @user = User.find_by_id(params[:user_id])
      @interest = Interest.new interest_params

      if @interest.save
        render json: @user, serializer: V1::UserSerializer, status: 200
      else
        render json: { error: t('interest_create_error')}, status: :unprocessable_entity
      end
    end

    def destroy
      @interest = Interest.find_by_id(params[:id])
      @interest.destroy
    end

    private

    def interest_params
      params.require(:interest).permit(:description, :user_id)
    end
  end
end

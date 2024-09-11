module Api
  class UserController < ApplicationController
    before_action :setUser, only: [:show]
    before_action :service

    def show
      begin
        @user = @service.getUser(params[:id])
        userSerializer = UserSerializer.new(@user)
        render json: userSerializer.as_json, status: :ok
      rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.message }, status: :not_found
      end
    end

    def me
      userSerializer = UserSerializer.new(@loggedUser)
      render json: userSerializer.as_json, status: :ok
    end

    def update
      begin
        @updatedUser = @service.updateUser(@loggedUser, updateParams)
        userSerializer = UserSerializer.new(@updatedUser)
        render json: userSerializer.as_json, status: :ok
      rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.message }, status: :conflict
      end
    end

    def confirm
      if @loggedUser.confirmed
        render json: { error: 'Email already confirmed' }, status: :conflict
        return
      end
      @service.confirmEmail(@loggedUser)
      render status: :no_content
    end

    def destroy
      @service.deleteUser(@user)
      render status: :no_content
    end

    private
    def service
      @service = UserService.new
    end

    def updateParams
      params.permit(:name, :email, :username)
    end

    def setUser
      @user = @service.getUser(params[:id])
    end

  end
end
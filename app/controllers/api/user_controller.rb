module Api
  class UserController < ApplicationController
    before_action :setUser, only: [:show]
    before_action :authMiddleware
    skip_before_action :authMiddleware, only: [:confirm]

    def initialize
      @service = UserService.new
    end

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
      begin
        @user = @service.findByToken(params[:token])

        if @user.confirmed
          return render json: { error: 'Email already confirmed' }, status: :conflict
        end

        @service.confirmEmail(@user)
        render json: {msg: 'Email confirmed!'},status: :ok
      rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.message }, status: :not_found
      end
    end

    def destroy
      @service.deleteUser(@user)
      render status: :no_content
    end

    private

    def updateParams
      params.permit(:name, :email, :username)
    end

    def setUser
      @user = @service.getUser(params[:id])
    end

  end
end
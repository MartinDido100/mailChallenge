module Api
  class AuthController < ApplicationController

    def initialize
      @service = AuthService.new
    end

    def signUp
      begin
        @user = @service.register(signUpParams)
        token = generateToken(userId: @user.id)
        UserMailer.confirm(@user).deliver_later!
        render json: {token: token}, status: :created
      rescue ActiveRecord::RecordInvalid => e
        render json: {error: e.message}, status: :unprocessable_entity
      end
    end
    
    def signIn
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        token = generateToken(userId: @user.id)
        render json: {token: token}, status: :ok
      else
        render json: {error: 'Incorrect email or password.'}, status: :unauthorized
      end
    end
  
    private
  
    def signUpParams
      params.permit(:name, :email, :password, :username)
    end

    def signInParams
      params.permit(:username, :password)
    end
  end
end
module Api
  class AuthController < ApplicationController
    skip_before_action :authMiddleware #Para que no pase por el middleware del Authorization header
  
    before_action :service

    def signUp
      @user = @service.register(signUpParams)

      token = generateToken(userId: @user.id)
      render json: {token: token}, status: :created
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
  
    def service
      @service = AuthService.new
    end

    def signInParams
      params.permit(:username, :password)
    end
  end
end
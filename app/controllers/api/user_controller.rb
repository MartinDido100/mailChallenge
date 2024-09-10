module Api
  class UserController < ApplicationController
    def show
      render json: User.find(params[:id])
    end

    def me
      userSerializer = UserSerializer.new(@loggedUser)
      render json: userSerializer.as_json, status: :ok
    end
  end
end
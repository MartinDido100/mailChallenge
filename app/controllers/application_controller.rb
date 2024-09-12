class ApplicationController < ActionController::API
  include JwtConcern

  private
    def authMiddleware
      header = request.headers['Authorization']
      if header
        token = header.split(" ").last
        decoded = decodeToken(token)
        @loggedUser = User.find(decoded['userId'])
      else
        render json: {error: 'Unauthorized, you must login'}, status: :unauthorized
      end
    end
end
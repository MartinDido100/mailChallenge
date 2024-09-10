class ApplicationController < ActionController::API
  include JwtConcern

  before_action :authMiddleware

  private
    def authMiddleware
      header = request.headers['Authorization']
      if header
        header = header.split(" ").last
        decoded = decodeToken(header)
        @loggedUser = User.find(decoded['userId'])
      else
        render json: {error: 'Unauthorized, you must login'}, status: :unauthorized
      end
    end
end
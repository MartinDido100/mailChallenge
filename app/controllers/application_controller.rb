require 'errors'

class ApplicationController < ActionController::API
  include JwtConcern

  rescue_from HttpError, with: :handleError
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

    def handleError(error)
      puts "Error: #{error.message}"
      render json: {error: error.message}, status: :internal_server_error
    end
end
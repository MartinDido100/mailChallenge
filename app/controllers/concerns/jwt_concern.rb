require 'jwt'
module JwtConcern
  extend ActiveSupport::Concern

  def authenticateUser
    header = request.headers['Authorization']
    if header
      token = header.split(" ").last
      decoded = decodeToken(token)
      @loggedUser = User.find(decoded['userId'])
    else
      render json: {error: 'Unauthorized, you must login'}, status: :unauthorized
    end
  end

  def generateToken(payload,exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    return JWT.encode(payload, ENV['JWT_SECRET'])
  end

  def decodeToken(token)
    decoded = JWT.decode(token, ENV['JWT_SECRET'])
    return decoded[0]
  end
end
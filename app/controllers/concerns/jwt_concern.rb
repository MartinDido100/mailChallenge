require 'jwt'
module JwtConcern
  extend ActiveSupport::Concern

  def generateToken(payload)
    return JWT.encode(payload, ENV['JWT_SECRET'])
  end

  def decodeToken(token)
    decoded = JWT.decode(token, ENV['JWT_SECRET'])[0]
    return decoded
  end
end
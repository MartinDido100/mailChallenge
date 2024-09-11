require 'jwt'
module JwtConcern
  extend ActiveSupport::Concern

  def generateToken(payload,exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    return JWT.encode(payload, ENV['JWT_SECRET'])
  end

  def decodeToken(token)
    decoded = JWT.decode(token, ENV['JWT_SECRET'])
    return decoded[0]
  end
end
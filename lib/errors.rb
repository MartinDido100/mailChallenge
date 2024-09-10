class HttpError < StandardError
  def initialize(message)
    super(message)
  end
end


class ConflictError < HttpError
  def initialize(message)
    puts "ConflictError"
    super(message)
  end
end
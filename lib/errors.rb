class HttpError < StandardError
  def initialize(message, status)
    super(message,status)
  end
end
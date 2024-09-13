class ApplicationSerializer
  def self.as_json(**args, &block)
    new(**args, &block).as_json
  end

  def self.model_as_json(**args, &block)
    new(**args, &block).model_as_json
  end
end
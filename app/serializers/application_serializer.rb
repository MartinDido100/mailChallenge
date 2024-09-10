class ApplicationSerializer
  def self.as_json(**args, &block)
    new(**args, &block).as_json
  end
end
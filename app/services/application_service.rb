class ApplicationService
  attr_reader :result, :success, :errors
  alias :success? :success

  class << self
    def call(*args)
      obj = new(*args)
      obj.call
      obj
    end
  end
end

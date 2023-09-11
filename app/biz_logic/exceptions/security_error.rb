module Exceptions
  class SecurityError < ApiError
    def initialize(option = {})
      super(title: 'Unauthorized', status: :unauthorized, detail: 'Invalid token', code: -1)      
    end    
  end
end

module ServiceModules::StatusableResource
  module Checks    
    def disabled?
      return Types::DISABLED == self.status
    end

    def active?
      return Types::ACTIVE == self.status
    end

    def closed?
      return Types::CLOSED == self.status
    end
  end
end

module ServiceModules
  module StatusableResource
    extend ActiveSupport::Concern

    include Checks
    include Types
    include Validators
    include DefaultScope
  end
end

module ServiceModules::StatusableResource
  module Validators
    extend ActiveSupport::Concern
    include ActiveRecord::Callbacks

    included do
      before_save do
         if (self.closed?  || self.disabled?) && (self.changed_attributes.exclude? "status")
          self.errors.add :base, self.status.to_sym
          throw :abort
        end
      end
    end
  end
end

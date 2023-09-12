module ServiceModules::StatusableResource
  module DefaultScope
    extend ActiveSupport::Concern

    class_methods do
      def default_scope 
        where.not(status: Types::DISABLED)
      end
    end
  end
end
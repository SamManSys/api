module Containers
  class PositionResource < ApplicationResource
    self.model = StorageContainerPosition
    polymorphic_belongs_to :content do
      group_by(:content_type) do
        on(:Store)
        on(:Specimen)
      end
    end
    belongs_to :store
  
    attribute :position_x, :string
    attribute :position_y, :string
  end  
end

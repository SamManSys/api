module Containers
  class PositionResource < ApplicationResource
    self.model = StorageContainerPosition
    polymorphic_belongs_to :content do
      group_by(:content_type) do
        on(:store)
        on(:sample)
      end
    end
    belongs_to :store
  
    attribute :content_id, :string, only: [:readable]
    attribute :content_type, :string, only: [:readable]
    attribute :content_name, :string, only: [:readable]

    attribute :position_x, :string, only: [:readable]
    attribute :position_y, :string, only: [:readable]
  end  
end

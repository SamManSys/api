class StorageContainerPositionResource < ApplicationResource
  polymorphic_belongs_to :content do
    group_by(:content_type) do
      on(:StorageContainer)
      on(:Specimen)
    end
  end
  belongs_to :storage_container

  attribute :position_x, :string
  attribute :position_y, :string
end

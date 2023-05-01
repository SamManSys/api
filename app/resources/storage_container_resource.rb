class StorageContainerResource < ApplicationResource
  belongs_to :storage_container_template
  
  attribute :name, :string
  attribute :size_x, :string
  attribute :size_y, :string
  attribute :barcode, :string
end

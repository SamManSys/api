class StoresContainerResource < ApplicationResource
  self.model = StoresContainer
  self.type = :stores_containers

  belongs_to :stores_template
  
  attribute :name, :string
  attribute :size_x, :string
  attribute :size_y, :string
  attribute :barcode, :string
end

module Containers
  class StoreResource < ApplicationResource
    self.model = Store
    belongs_to :template
    
    attribute :name, :string
    attribute :size_x, :string
    attribute :size_y, :string
    attribute :barcode, :string
  end  
end

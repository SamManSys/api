class SampleResource < ApplicationResource
  self.model = Specimen
  self.type = :samples
  
  belongs_to :specimen_collection 
  primary_endpoint '/samples', [:index, :show, :create, :update, :destroy]

  attribute :label, :string
  attribute :barcode, :string
  attribute :specimen_class, :string
  attribute :specimen_type, :string
  attribute :comments, :string, sortable: false
  attribute :born_on, :date
  attribute :status, :string
  attribute :site, :string
  attribute :side, :string
  attribute :availability, :string
  attribute :available_quantity, :float
  
  attribute :specimen_collection_id, :integer, only: [:filterable]
end

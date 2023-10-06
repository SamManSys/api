class SampleResource < ApplicationResource
  belongs_to :sample_collection
  
  attribute :label, :string
  attribute :barcode, :string
  attribute :sample_class, :string
  attribute :sample_type, :string
  attribute :comments, :string, sortable: false
  attribute :born_on, :date
  attribute :status, :string
  attribute :site, :string
  attribute :side, :string
  attribute :availability, :string
  attribute :available_quantity, :float
  
  attribute :sample_collection_id, :integer, only: [:filterable]
  end

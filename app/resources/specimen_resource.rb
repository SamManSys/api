class SpecimenResource < ApplicationResource
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
end

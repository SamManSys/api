class SpecimenResource < ApplicationResource
  attribute :label, :string
  attribute :barcode, :string
  attribute :specimen_class, :string
  attribute :specimen_type, :string
end

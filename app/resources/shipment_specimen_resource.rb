class ShipmentSpecimenResource < ApplicationResource
  belongs_to :specimen
  belongs_to :shipment

  attribute :specimen_id, :integer, only: [:filterable]
  attribute :shipment_id, :integer, only: [:filterable]
end
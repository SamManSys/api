class ShipmentSampleResource < ApplicationResource
  belongs_to :sample
  belongs_to :shipment

  attribute :sampleid, :integer, only: [:filterable]
  attribute :shipment_id, :integer, only: [:filterable]
end

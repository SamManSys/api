class ShipmentSpecimen < ApplicationRecord
  belongs_to :shipment
  belongs_to :specimen
end
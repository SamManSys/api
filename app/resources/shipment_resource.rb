class ShipmentResource < ApplicationResource
  attribute :name, :string
  attribute :date, :datetime
  attribute :to, :string
  attribute :status, :string
  attribute :lab_id, :string
  attribute :tr_sr_id, :string
end

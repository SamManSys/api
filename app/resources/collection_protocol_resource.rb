class CollectionProtocolResource < ApplicationResource
  attribute :start_date, :datetime
  attribute :ethics_number, :string
  attribute :status, :string
  attribute :short_protocol_name, :string
end

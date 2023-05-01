class RegistrationToCpResource < ApplicationResource
  belongs_to :collection_protocol
  belongs_to :patient, optional: true
  
  attribute :date, :datetime
  attribute :registration_identifier, :string
end

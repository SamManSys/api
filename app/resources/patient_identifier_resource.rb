class PatientIdentifierResource < ApplicationResource
  belongs_to :patient
  
  attribute :identifier, :string
  attribute :identifier_type, :string
end

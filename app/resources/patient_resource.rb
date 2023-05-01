class PatientResource < ApplicationResource
  attribute :firstname, :string
  attribute :surname, :string
  attribute :dob, :datetime
  attribute :dod, :datetime
end

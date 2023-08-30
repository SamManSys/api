class SpecimenCollectionResource < ApplicationResource
  has_many :samples

  attribute :study_point_name, :string
  attribute :collection_date, :datetime
  attribute :status, :string
  attribute :diagnosis, :string
  attribute :pathology_number, :string
  attribute :clinical_status, :string
  attribute :comments, :string
  attribute :collection_status, :string
  attribute :not_collected_reason, :string
end

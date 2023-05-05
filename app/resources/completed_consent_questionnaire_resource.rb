class CompletedConsentQuestionnaireResource < ApplicationResource
  belongs_to :registration_to_cp

  attribute :signed_date, :datetime
  attribute :witness_name, :string
  attribute :scanned_uri, :string
  attribute :qc_performed, :boolean
  attribute :template_name, :string

  attribute :registration_to_cp_id, :integer, only: [:filterable]
end

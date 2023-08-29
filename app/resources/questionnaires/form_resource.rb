module Questionnaires
  class FormResource < ApplicationResource
    self.model = CompletedConsentQuestionnaire
    self.type = :form

    belongs_to :registration_to_cp
    has_many :responses
    
    attribute :signed_date, :datetime
    attribute :witness_name, :string
    attribute :scanned_uri, :string
    attribute :qc_performed, :boolean
    attribute :template_name, :string
  
    attribute :registration_to_cp_id, :integer, only: [:filterable]
  end
end
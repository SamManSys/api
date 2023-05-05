class ConsentQuestionnaireQuestionResource < ApplicationResource
  belongs_to :consent_questionnaire_template

  attribute :question, :string
  attribute :position, :integer
  attribute :status, :string

  attribute :consent_questionnaire_template_id, :integer, only: [:filterable]
end

class ConsentQuestionnaireResponseResource < ApplicationResource
  belongs_to :completed_consent_questionnaire
  belongs_to :consent_questionnaire_question

  attribute :answer, :string

  attribute :completed_consent_questionnaire_id, :integer, only: [:filterable]
  attribute :consent_questionnaire_question_id, :integer, only: [:filterable]
end

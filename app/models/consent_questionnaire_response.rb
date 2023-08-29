class ConsentQuestionnaireResponse < ApplicationRecord
  belongs_to :completed_consent_questionnaire
  belongs_to :consent_questionnaire_question

  validates_presence_of :answer

  # TODO investigate if the alias can be removed
  # Alias used as a bridge between API and database
  alias_attribute :question, :consent_questionnaire_question_id
  alias_attribute :form, :completed_consent_questionnaire_id
end

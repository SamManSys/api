class ConsentQuestionnaireResponse < ApplicationRecord
  belongs_to :completed_consent_questionnaire
  belongs_to :consent_questionnaire_question

  validates_presence_of :answer
end
class ActiveConsentQuestionnaireTemplate < ApplicationRecord
  belongs_to :collection_protocol
  belongs_to :consent_questionnaire_template
end
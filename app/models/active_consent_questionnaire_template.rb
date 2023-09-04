class ActiveConsentQuestionnaireTemplate < ApplicationRecord
  belongs_to :collection_protocol
  belongs_to :questionnaires_template
end
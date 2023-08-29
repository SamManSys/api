class ConsentQuestionnaireQuestion < ApplicationRecord
  belongs_to :consent_questionnaire_template
  default_scope { where.not(status: :disabled)}
  
  validates_presence_of :position
  validates_presence_of :question
  validates_with ClosedValidator

  # Alias used as a bridge between API and database
  alias_attribute :template, :consent_questionnaire_template_id
end

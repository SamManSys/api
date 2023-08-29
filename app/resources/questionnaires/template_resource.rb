module Questionnaires
  class TemplateResource < ApplicationResource
    self.model = ConsentQuestionnaireTemplate  
    self.type = :consent_questionnaire_templates
    attribute :name, :string
  end
end

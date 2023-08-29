module Questionnaires
  class TemplateResource < ApplicationResource
    self.model = ConsentQuestionnaireTemplate  
    self.type = :templates
    attribute :name, :string
  end
end

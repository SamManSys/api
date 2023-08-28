module Questionnaires
  class TemplateResource < ApplicationResource
    self.model = ConsentQuestionnaireTemplate  

    attribute :name, :string
  end
end

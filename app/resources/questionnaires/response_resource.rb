module Questionnaires
  class ResponseResource < ApplicationResource
    self.model = ConsentQuestionnaireResponse  
    self.type = :responses
    belongs_to :question
    belongs_to :form

    attribute :answer, :string
  end
end
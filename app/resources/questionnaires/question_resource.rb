module Questionnaires
  class QuestionResource < ApplicationResource
    self.model = ConsentQuestionnaireQuestion 
    self.type = :questions

    belongs_to :template

    attribute :question, :string
    attribute :position, :integer
    attribute :status, :string
  
    #attribute :consent_questionnaire_template_id, :integer, only: [:filterable]
  end
end
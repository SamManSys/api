class QuestionnairesResponseResource < ApplicationResource
  belongs_to :questionnaires_question
  belongs_to :questionnaires_form

  attribute :answer, :string
end

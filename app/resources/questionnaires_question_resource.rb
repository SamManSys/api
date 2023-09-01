class QuestionnairesQuestionResource < ApplicationResource
  belongs_to :questionnaires_template

  attribute :question, :string
  attribute :position, :integer
  attribute :status, :string

end

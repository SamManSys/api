class QuestionnairesResponse < ApplicationRecord
  belongs_to :questionnaires_form
  belongs_to :questionnaires_question

  validates_presence_of :answer
end

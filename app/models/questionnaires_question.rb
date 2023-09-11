class QuestionnairesQuestion < ApplicationRecord
  belongs_to :questionnaires_template
  default_scope { where.not(status: :disabled)}
  
  validates_presence_of :position
  validates_presence_of :question
  validates_with ClosedValidator
end

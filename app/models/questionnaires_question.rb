class QuestionnairesQuestion < ApplicationRecord
  include ServiceModules::StatusableResource
  belongs_to :questionnaires_template
  
  validates_presence_of :position
  validates_presence_of :question
end

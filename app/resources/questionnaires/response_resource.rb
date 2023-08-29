module Questionnaires
  class ResponseResource < ApplicationResource
    belongs_to :question

    attribute :answer, :string
  end
end
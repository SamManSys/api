module Questionnaires 
  class QuestionsController < ApplicationController
    def index
      questions = QuestionResource.all(params)
      respond_with(questions)
    end
  
    def show
      question = QuestionResource.find(params)
      respond_with(question)
    end
  
    def create
      question = QuestionResource.build(params)
  
      if question.save
        render jsonapi: question, status: 201
      else
        render jsonapi_errors: question
      end
    end
  
    def update
      question = QuestionResource.find(params)
  
      if question.update_attributes
        render jsonapi: question
      else
        render jsonapi_errors: question
      end
    end
  
    def destroy
      question = QuestionResource.find(params)
  
      if question.destroy
        render jsonapi: { meta: {} }, status: 200
      else
        render jsonapi_errors: question
      end
    end
  end  
end

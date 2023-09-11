
class QuestionnairesQuestionsController < ApplicationController
  def index
    questions = QuestionnairesQuestionResource.all(params)
    respond_with(questions)
  end

  def show
    question = QuestionnairesQuestionResource.find(params)
    respond_with(question)
  end

  def create
    question = QuestionnairesQuestionResource.build(params)

    if question.save
      render jsonapi: question, status: 201
    else
      render jsonapi_errors: question
    end
  end

  def update
    question = QuestionnairesQuestionResource.find(params)

    if question.update_attributes
      render jsonapi: question
    else
      render jsonapi_errors: question
    end
  end

  def destroy
    question = QuestionnairesQuestionResource.find(params)

    if question.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: question
    end
  end
end  

class ConsentQuestionnaireQuestionsController < ApplicationController
  def index
    consent_questionnaire_questions = ConsentQuestionnaireQuestionResource.all(params)
    respond_with(consent_questionnaire_questions)
  end

  def show
    consent_questionnaire_question = ConsentQuestionnaireQuestionResource.find(params)
    respond_with(consent_questionnaire_question)
  end

  def create
    consent_questionnaire_question = ConsentQuestionnaireQuestionResource.build(params)

    if consent_questionnaire_question.save
      render jsonapi: consent_questionnaire_question, status: 201
    else
      render jsonapi_errors: consent_questionnaire_question
    end
  end

  def update
    consent_questionnaire_question = ConsentQuestionnaireQuestionResource.find(params)

    if consent_questionnaire_question.update_attributes
      render jsonapi: consent_questionnaire_question
    else
      render jsonapi_errors: consent_questionnaire_question
    end
  end

  def destroy
    consent_questionnaire_question = ConsentQuestionnaireQuestionResource.find(params)

    if consent_questionnaire_question.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: consent_questionnaire_question
    end
  end
end

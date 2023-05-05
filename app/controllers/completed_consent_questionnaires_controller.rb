class CompletedConsentQuestionnairesController < ApplicationController
  def index
    completed_consent_questionnaires = CompletedConsentQuestionnaireResource.all(params)
    respond_with(completed_consent_questionnaires)
  end

  def show
    completed_consent_questionnaire = CompletedConsentQuestionnaireResource.find(params)
    respond_with(completed_consent_questionnaire)
  end

  def create
    completed_consent_questionnaire = CompletedConsentQuestionnaireResource.build(params)

    if completed_consent_questionnaire.save
      render jsonapi: completed_consent_questionnaire, status: 201
    else
      render jsonapi_errors: completed_consent_questionnaire
    end
  end

  def update
    completed_consent_questionnaire = CompletedConsentQuestionnaireResource.find(params)

    if completed_consent_questionnaire.update_attributes
      render jsonapi: completed_consent_questionnaire
    else
      render jsonapi_errors: completed_consent_questionnaire
    end
  end

  def destroy
    completed_consent_questionnaire = CompletedConsentQuestionnaireResource.find(params)

    if completed_consent_questionnaire.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: completed_consent_questionnaire
    end
  end
end

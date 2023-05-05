class ConsentQuestionnaireResponsesController < ApplicationController
  def index
    consent_questionnaire_responses = ConsentQuestionnaireResponseResource.all(params)
    respond_with(consent_questionnaire_responses)
  end

  def show
    consent_questionnaire_response = ConsentQuestionnaireResponseResource.find(params)
    respond_with(consent_questionnaire_response)
  end

  def create
    consent_questionnaire_response = ConsentQuestionnaireResponseResource.build(params)

    if consent_questionnaire_response.save
      render jsonapi: consent_questionnaire_response, status: 201
    else
      render jsonapi_errors: consent_questionnaire_response
    end
  end

  def update
    consent_questionnaire_response = ConsentQuestionnaireResponseResource.find(params)

    if consent_questionnaire_response.update_attributes
      render jsonapi: consent_questionnaire_response
    else
      render jsonapi_errors: consent_questionnaire_response
    end
  end

  def destroy
    consent_questionnaire_response = ConsentQuestionnaireResponseResource.find(params)

    if consent_questionnaire_response.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: consent_questionnaire_response
    end
  end
end

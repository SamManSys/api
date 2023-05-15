class ActiveConsentQuestionnaireTemplatesController < ApplicationController
  def index
    active_consent_questionnaire_templates = ActiveConsentQuestionnaireTemplateResource.all(params)
    respond_with(active_consent_questionnaire_templates)
  end

  def show
    active_consent_questionnaire_template = ActiveConsentQuestionnaireTemplateResource.find(params)
    respond_with(active_consent_questionnaire_template)
  end

  def create
    active_consent_questionnaire_template = ActiveConsentQuestionnaireTemplateResource.build(params)

    if active_consent_questionnaire_template.save
      render jsonapi: active_consent_questionnaire_template, status: 201
    else
      render jsonapi_errors: active_consent_questionnaire_template
    end
  end

  def update
    active_consent_questionnaire_template = ActiveConsentQuestionnaireTemplateResource.find(params)

    if active_consent_questionnaire_template.update_attributes
      render jsonapi: active_consent_questionnaire_template
    else
      render jsonapi_errors: active_consent_questionnaire_template
    end
  end

  def destroy
    active_consent_questionnaire_template = ActiveConsentQuestionnaireTemplateResource.find(params)

    if active_consent_questionnaire_template.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: active_consent_questionnaire_template
    end
  end
end

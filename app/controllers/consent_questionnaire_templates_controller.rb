class ConsentQuestionnaireTemplatesController < ApplicationController
  def index
    consent_questionnaire_templates = ConsentQuestionnaireTemplateResource.all(params)
    respond_with(consent_questionnaire_templates)
  end

  def show
    consent_questionnaire_template = ConsentQuestionnaireTemplateResource.find(params)
    respond_with(consent_questionnaire_template)
  end

  def create
    consent_questionnaire_template = ConsentQuestionnaireTemplateResource.build(params)

    if consent_questionnaire_template.save
      render jsonapi: consent_questionnaire_template, status: 201
    else
      render jsonapi_errors: consent_questionnaire_template
    end
  end

  def update
    consent_questionnaire_template = ConsentQuestionnaireTemplateResource.find(params)

    if consent_questionnaire_template.update_attributes
      render jsonapi: consent_questionnaire_template
    else
      render jsonapi_errors: consent_questionnaire_template
    end
  end

  def destroy
    consent_questionnaire_template = ConsentQuestionnaireTemplateResource.find(params)

    if consent_questionnaire_template.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: consent_questionnaire_template
    end
  end
end

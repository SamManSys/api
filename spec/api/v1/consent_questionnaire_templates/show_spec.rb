require 'rails_helper'

RSpec.describe "consent_questionnaire_templates#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/consent_questionnaire_templates/#{consent_questionnaire_template.id}", params: params
  end

  describe 'basic fetch' do
    let!(:consent_questionnaire_template) { create(:consent_questionnaire_template) }

    it 'works' do
      expect(ConsentQuestionnaireTemplateResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('consent_questionnaire_templates')
      expect(d.id).to eq(consent_questionnaire_template.id)
    end
  end
end

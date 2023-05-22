require 'rails_helper'

RSpec.describe "consent_questionnaire_templates#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/consent_questionnaire_templates", params: params
  end

  describe 'basic fetch' do
    let!(:consent_questionnaire_template1) { create(:consent_questionnaire_template) }
    let!(:consent_questionnaire_template2) { create(:consent_questionnaire_template) }

    it 'works' do
      expect(ConsentQuestionnaireTemplateResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['consent_questionnaire_templates'])
      expect(d.map(&:id)).to match_array([consent_questionnaire_template1.id, consent_questionnaire_template2.id])
    end
  end
end
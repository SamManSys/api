require 'rails_helper'

RSpec.describe "completed_consent_questionnaires#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/completed_consent_questionnaires/#{completed_consent_questionnaire.id}", params: params
  end

  describe 'basic fetch' do
    let!(:completed_consent_questionnaire) { create(:completed_consent_questionnaire) }

    it 'works' do
      expect(CompletedConsentQuestionnaireResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('completed_consent_questionnaires')
      expect(d.id).to eq(completed_consent_questionnaire.id)
    end
  end
end

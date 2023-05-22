require 'rails_helper'

RSpec.describe "consent_questionnaire_responses#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/consent_questionnaire_responses", params: params
  end

  describe 'basic fetch' do
    let!(:consent_questionnaire_response1) { create(:consent_questionnaire_response) }
    let!(:consent_questionnaire_response2) { create(:consent_questionnaire_response) }

    it 'works' do
      expect(ConsentQuestionnaireResponseResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['consent_questionnaire_responses'])
      expect(d.map(&:id)).to match_array([consent_questionnaire_response1.id, consent_questionnaire_response2.id])
    end
  end
end
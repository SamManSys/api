require 'rails_helper'

RSpec.describe "consent_questionnaire_questions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/consent_questionnaire_questions/#{consent_questionnaire_question.id}", params: params
  end

  describe 'basic fetch' do
    let!(:consent_questionnaire_question) { create(:consent_questionnaire_question) }

    it 'works' do
      expect(ConsentQuestionnaireQuestionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('consent_questionnaire_questions')
      expect(d.id).to eq(consent_questionnaire_question.id)
    end
  end
end

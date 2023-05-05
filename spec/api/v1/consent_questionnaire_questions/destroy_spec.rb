require 'rails_helper'

RSpec.describe "consent_questionnaire_questions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/consent_questionnaire_questions/#{consent_questionnaire_question.id}"
  end

  describe 'basic destroy' do
    let!(:consent_questionnaire_question) { create(:consent_questionnaire_question) }

    it 'updates the resource' do
      expect(ConsentQuestionnaireQuestionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ConsentQuestionnaireQuestion.count }.by(-1)
      expect { consent_questionnaire_question.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

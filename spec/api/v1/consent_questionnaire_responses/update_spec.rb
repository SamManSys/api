require 'rails_helper'

RSpec.describe "consent_questionnaire_responses#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/consent_questionnaire_responses/#{consent_questionnaire_response.id}", payload
  end

  describe 'basic update' do
    let!(:consent_questionnaire_response) { create(:consent_questionnaire_response) }

    let(:payload) do
      {
        data: {
          id: consent_questionnaire_response.id.to_s,
          type: 'consent_questionnaire_responses',
          attributes: {
            answer: 'new answer'
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ConsentQuestionnaireResponseResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { consent_questionnaire_response.reload.attributes }
    end
  end
end

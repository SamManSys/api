require 'rails_helper'

RSpec.describe "completed_consent_questionnaires#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/completed_consent_questionnaires/#{completed_consent_questionnaire.id}", payload
  end

  describe 'basic update' do
    let!(:completed_consent_questionnaire) { create(:completed_consent_questionnaire) }

    let(:payload) do
      {
        data: {
          id: completed_consent_questionnaire.id.to_s,
          type: 'completed_consent_questionnaires',
          attributes: {
            witness_name: Faker::Name.name
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(CompletedConsentQuestionnaireResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { completed_consent_questionnaire.reload.attributes }
    end
  end
end

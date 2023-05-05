require 'rails_helper'

RSpec.describe "completed_consent_questionnaires#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/completed_consent_questionnaires", payload
  end

  describe 'basic create' do
    let(:registration_to_cp) {
      create(:registration_to_cp)
    }

    let(:params) do
      attributes_for(:completed_consent_questionnaire)
    end
    let(:payload) do
      {
        data: {
          type: 'completed_consent_questionnaires',
          attributes: params,
          relationships: {
            registration_to_cp: {
              data: {
                type: 'registration_to_cps',
                id: registration_to_cp.id.to_s
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect(CompletedConsentQuestionnaireResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { CompletedConsentQuestionnaire.count }.by(1)
    end
  end
end

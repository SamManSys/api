require 'rails_helper'

RSpec.describe "consent_questionnaire_responses#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/consent_questionnaire_responses", payload
  end

  describe 'basic create' do
    let(:consent_questionnaire_question) do
      create(:consent_questionnaire_question)
    end
    let(:completed_consent_questionnaire) do
      create(:completed_consent_questionnaire)
    end

    let(:params) do
      attributes_for(:consent_questionnaire_response)
    end
    let(:payload) do
      {
        data: {
          type: 'consent_questionnaire_responses',
          attributes: params,
          relationships: {
            consent_questionnaire_question: {
              data: {
                type: 'consent_questionnaire_questions',
                id: consent_questionnaire_question.id.to_s
              }               
            },
            completed_consent_questionnaire: {
              data: {
                type: 'completed_consent_questionnaires',
                id: completed_consent_questionnaire.id.to_s  
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect(ConsentQuestionnaireResponseResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ConsentQuestionnaireResponse.count }.by(1)
    end
  end
end

require 'rails_helper'

RSpec.describe "consent_questionnaire_questions#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/consent_questionnaire_questions", payload
  end

  describe 'basic create' do
    let(:consent_questionnaire_template) do
      create(:consent_questionnaire_template)
    end
    let(:params) do
      attributes_for(:consent_questionnaire_question, :question_1)
    end
    let(:payload) do
      {
        data: {
          type: 'consent_questionnaire_questions',
          attributes: params,
          relationships: {
            consent_questionnaire_template: {
              data: {
                type: 'consent_questionnaire_templates',
                id: consent_questionnaire_template.id.to_s
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect(ConsentQuestionnaireQuestionResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ConsentQuestionnaireQuestion.count }.by(1)
    end
  end
end

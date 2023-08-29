require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "responses#create", type: :request do
    subject(:make_request) do
      jsonapi_post "/api/v1/questionnaires/responses", payload
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
            type: 'responses',
            attributes: params,
            relationships: {
              question: {
                data: {
                  type: 'questions',
                  id: consent_questionnaire_question.id.to_s
                }               
              },
              form: {
                data: {
                  type: 'forms',
                  id: completed_consent_questionnaire.id.to_s  
                }
              }
            }
          }
        }
      end

      it 'works' do
        expect(Questionnaires::ResponseResource).to receive(:build).and_call_original
        expect {
          make_request
          expect(response.status).to eq(201), response.body
        }.to change { ConsentQuestionnaireResponse.count }.by(1)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "responses#create", type: :request do
    subject(:make_request) do
      jsonapi_post "/api/v1/questionnaires_responses", payload
    end

    describe 'basic create' do
      let(:questionnaire_question) do
        create(:questionnaires_question)
      end
      let(:questionnaires_form) do
        create(:questionnaires_form)
      end

      let(:params) do
        attributes_for(:questionnaires_response)
      end
      let(:payload) do
        {
          data: {
            type: 'questionnaires_responses',
            attributes: params,
            relationships: {
              questionnaires_question: {
                data: {
                  type: 'questionnaires_questions',
                  id: questionnaire_question.id.to_s
                }               
              },
              questionnaires_form: {
                data: {
                  type: 'questionnaires_forms',
                  id: questionnaires_form.id.to_s  
                }
              }
            }
          }
        }
      end

      it 'works' do
        expect(QuestionnairesResponseResource).to receive(:build).and_call_original
        expect {
          make_request
          expect(response.status).to eq(201), response.body
        }.to change { QuestionnairesResponse.count }.by(1)
      end
    end
  end
end

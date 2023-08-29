require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "questions#update", type: :request do
    subject(:make_request) do
      jsonapi_put "/api/v1/questionnaires/questions/#{consent_questionnaire_question.id}", payload
    end

    describe 'basic update' do
      let!(:consent_questionnaire_question) { create(:consent_questionnaire_question) }

      let(:payload) do
        {
          data: {
            id: consent_questionnaire_question.id.to_s,
            type: 'questions',
            attributes: {
              question: 'Meh'
            }
          }
        }
      end

      # Replace 'xit' with 'it' after adding attributes
      it 'updates the resource' do
        expect(Questionnaires::QuestionResource).to receive(:find).and_call_original
        expect {
          make_request
          expect(response.status).to eq(200), response.body
        }.to change { consent_questionnaire_question.reload.attributes }
      end
    end
  end
end

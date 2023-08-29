require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "questions#show", type: :request do
    let(:params) { {} }

    subject(:make_request) do
      jsonapi_get "/api/v1/questionnaires/questions/#{consent_questionnaire_question.id}", params: params
    end

    describe 'basic fetch' do
      let!(:consent_questionnaire_question) { create(:consent_questionnaire_question) }

      it 'works' do
        expect(Questionnaires::QuestionResource).to receive(:find).and_call_original
        make_request
        expect(response.status).to eq(200)
        expect(d.jsonapi_type).to eq('questions')
        expect(d.id).to eq(consent_questionnaire_question.id)
      end
    end
  end
end

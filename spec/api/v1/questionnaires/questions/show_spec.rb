require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "questions#show", type: :request do
    let(:params) { {} }

    subject(:make_request) do
      jsonapi_get "/api/v1/questionnaires_questions/#{questionnaires_question.id}", params: params
    end

    describe 'basic fetch' do
      let!(:questionnaires_question) { create(:questionnaires_question) }

      it 'works' do
        expect(QuestionnairesQuestionResource).to receive(:find).and_call_original
        make_request
        expect(response.status).to eq(200)
        expect(d.jsonapi_type).to eq('questionnaires_questions')
        expect(d.id).to eq(questionnaires_question.id)
      end
    end
  end
end

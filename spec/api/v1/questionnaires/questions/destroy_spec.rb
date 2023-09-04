require 'rails_helper'

describe "questions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/questionnaires_questions/#{questionnaires_question.id}"
  end

  describe 'basic destroy' do
    let!(:questionnaires_question) { create(:questionnaires_question) }

    it 'updates the resource' do
      expect(QuestionnairesQuestionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { QuestionnairesQuestion.count }.by(-1)
      expect { questionnaires_question.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end


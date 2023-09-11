require 'rails_helper'

describe "questionnaires_questions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/questionnaires_questions/#{questionnaires_question.id}", payload
  end

  describe 'basic update' do
    let!(:questionnaires_question) { create(:questionnaires_question) }

    let(:payload) do
      {
        data: {
          id: questionnaires_question.id.to_s,
          type: 'questionnaires_questions',
          attributes: {
            question: 'Meh'
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(QuestionnairesQuestionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { questionnaires_question.reload.attributes }
    end
  end
end

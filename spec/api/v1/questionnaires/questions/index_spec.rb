require 'rails_helper'

describe "questionnaires_questions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/questionnaires_questions", params: params
  end

  describe 'basic fetch' do
    let!(:questionnaire_question1) { create(:questionnaires_question) }
    let!(:questionnaire_question2) { create(:questionnaires_question, :question_1) }

    it 'works' do
      expect(QuestionnairesQuestionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['questionnaires_questions'])
      expect(d.map(&:id)).to match_array([questionnaire_question1.id, questionnaire_question2.id])
    end
  end
end

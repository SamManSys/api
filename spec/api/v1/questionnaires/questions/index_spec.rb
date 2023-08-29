require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "questions#index", type: :request do
    let(:params) { {} }

    subject(:make_request) do
      jsonapi_get "/api/v1/questionnaires/questions", params: params
    end

    describe 'basic fetch' do
      let!(:consent_questionnaire_question1) { create(:consent_questionnaire_question) }
      let!(:consent_questionnaire_question2) { create(:consent_questionnaire_question, :question_1) }

      it 'works' do
        expect(Questionnaires::QuestionResource).to receive(:all).and_call_original
        make_request
        expect(response.status).to eq(200), response.body
        expect(d.map(&:jsonapi_type).uniq).to match_array(['questions'])
        expect(d.map(&:id)).to match_array([consent_questionnaire_question1.id, consent_questionnaire_question2.id])
      end
    end
  end
end

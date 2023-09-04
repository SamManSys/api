require 'rails_helper'

describe "questionnaires_questions#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/questionnaires_questions", payload
  end

  describe 'basic create' do
    let(:questionnaires_template) do
      create(:questionnaires_template)
    end
    let(:params) do
      attributes_for(:questionnaires_question, :question_1)
    end
    let(:payload) do
      {
        data: {
          type: 'questionnaires_questions',
          attributes: params,
          relationships: {
            questionnaires_template: {
              data: {
                type: 'questionnaires_templates',
                id: questionnaires_template.id.to_s
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect(QuestionnairesQuestionResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { QuestionnairesQuestion.count }.by(1)
    end
  end
end

require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "templates#create", type: :request do
    subject(:make_request) do
      jsonapi_post "/api/v1/questionnaires/templates", payload
    end

    describe 'basic create' do
      let(:params) do
        attributes_for(:consent_questionnaire_template)
      end
      let(:payload) do
        {
          data: {
            type: 'consent_questionnaire_templates',
            attributes: params
          }
        }
      end

      it 'works' do
        expect(Questionnaires::TemplateResource).to receive(:build).and_call_original
        expect {
          make_request
          expect(response.status).to eq(201), response.body
        }.to change { ConsentQuestionnaireTemplate.count }.by(1)
      end
    end
  end
end


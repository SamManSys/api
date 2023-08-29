require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "templates#update", type: :request do
    subject(:make_request) do
      jsonapi_put "/api/v1/questionnaires/templates/#{consent_questionnaire_template.id}", payload
    end

    describe 'basic update' do
      let!(:consent_questionnaire_template) { create(:consent_questionnaire_template) }

      let(:payload) do
        {
          data: {
            id: consent_questionnaire_template.id.to_s,
            type: 'consent_questionnaire_templates',
            attributes: {
              name: 'Meh'
            }
          }
        }
      end

      # Replace 'xit' with 'it' after adding attributes
      it 'updates the resource' do
        expect(Questionnaires::TemplateResource).to receive(:find).and_call_original
        expect {
          make_request
          expect(response.status).to eq(200), response.body
        }.to change { consent_questionnaire_template.reload.attributes }
      end
    end
  end
end

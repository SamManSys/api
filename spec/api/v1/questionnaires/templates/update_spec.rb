require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "templates#update", type: :request do
    subject(:make_request) do
      jsonapi_put "/api/v1/questionnaires_templates/#{questionnaires_template.id}", payload
    end

    describe 'basic update' do
      let!(:questionnaires_template) { create(:questionnaires_template) }

      let(:payload) do
        {
          data: {
            id: questionnaires_template.id.to_s,
            type: 'questionnaires_templates',
            attributes: {
              name: 'Meh'
            }
          }
        }
      end

      # Replace 'xit' with 'it' after adding attributes
      it 'updates the resource' do
        expect(QuestionnairesTemplateResource).to receive(:find).and_call_original
        expect {
          make_request
          expect(response.status).to eq(200), response.body
        }.to change { questionnaires_template.reload.attributes }
      end
    end
  end
end

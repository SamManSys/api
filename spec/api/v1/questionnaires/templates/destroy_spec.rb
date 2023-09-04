require 'rails_helper'

Rails.describe "questionnaires", type: :request do
  describe "templates#destroy", type: :request do
    subject(:make_request) do
      jsonapi_delete "/api/v1/questionnaires_templates/#{questionnaires_template.id}"
    end

    describe 'basic destroy' do
      let!(:questionnaires_template) { create(:questionnaires_template) }

      it 'updates the resource' do
        expect(QuestionnairesTemplateResource).to receive(:find).and_call_original
        expect {
          make_request
          expect(response.status).to eq(200), response.body
        }.to change { QuestionnairesTemplate.count }.by(-1)
        expect { questionnaires_template.reload }
          .to raise_error(ActiveRecord::RecordNotFound)
        expect(json).to eq('meta' => {})
      end
    end
  end
end

require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "templates#show", type: :request do
    let(:params) { {} }

    subject(:make_request) do
      jsonapi_get "/api/v1/questionnaires_templates/#{questionnaires_template.id}", params: params
    end

    describe 'basic fetch' do
      let!(:questionnaires_template) { create(:questionnaires_template) }

      it 'works' do
        expect(QuestionnairesTemplateResource).to receive(:find).and_call_original
        make_request
        expect(response.status).to eq(200)
        expect(d.jsonapi_type).to eq('questionnaires_templates')
        expect(d.id).to eq(questionnaires_template.id)
      end
    end
  end
end
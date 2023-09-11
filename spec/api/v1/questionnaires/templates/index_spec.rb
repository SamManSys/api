require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "templates#index", type: :request do
    let(:params) { {} }

    subject(:make_request) do
      jsonapi_get "/api/v1/questionnaires_templates", params: params
    end

    describe 'basic fetch' do
      let!(:questionnaires_template1) { create(:questionnaires_template) }
      let!(:questionnaires_template2) { create(:questionnaires_template) }

      it 'works' do
        expect(QuestionnairesTemplateResource).to receive(:all).and_call_original
        make_request
        expect(response.status).to eq(200), response.body
        expect(d.map(&:jsonapi_type).uniq).to match_array(['questionnaires_templates'])
        expect(d.map(&:id)).to match_array([questionnaires_template1.id, questionnaires_template2.id])
      end
    end
  end
end

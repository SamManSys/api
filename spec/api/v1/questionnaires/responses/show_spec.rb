require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "responses#show", type: :request do
    let(:params) { {} }

    subject(:make_request) do
      jsonapi_get "/api/v1/questionnaires_responses/#{questionnaires_response.id}", params: params
    end

    describe 'basic fetch' do
      let!(:questionnaires_response) { create(:questionnaires_response) }

      it 'works' do
        expect(QuestionnairesResponseResource).to receive(:find).and_call_original
        make_request
        expect(response.status).to eq(200)
        expect(d.jsonapi_type).to eq('questionnaires_responses')
        expect(d.id).to eq(questionnaires_response.id)
      end
    end
  end
end
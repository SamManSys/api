require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "responses#index", type: :request do
    let(:params) { {} }

    subject(:make_request) do
      jsonapi_get "/api/v1/questionnaires_responses", params: params
    end

    describe 'basic fetch' do
      let!(:questionnaires_response1) { create(:questionnaires_response) }
      let!(:questionnaires_response2) { create(:questionnaires_response) }

      it 'works' do
        expect(QuestionnairesResponseResource).to receive(:all).and_call_original
        make_request
        expect(response.status).to eq(200), response.body
        expect(d.map(&:jsonapi_type).uniq).to match_array(['questionnaires_responses'])
        expect(d.map(&:id)).to match_array([questionnaires_response1.id, questionnaires_response2.id])
      end
    end
  end
end

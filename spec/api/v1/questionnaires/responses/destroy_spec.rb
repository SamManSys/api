require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "responses#destroy", type: :request do
    subject(:make_request) do
      jsonapi_delete "/api/v1/questionnaires_responses/#{questionnaires_response.id}"
    end

    describe 'basic destroy' do
      let!(:questionnaires_response) { create(:questionnaires_response) }

      it 'updates the resource' do
        expect(QuestionnairesResponseResource).to receive(:find).and_call_original
        expect {
          make_request
          expect(response.status).to eq(200), response.body
        }.to change { QuestionnairesResponse.count }.by(-1)
        expect { questionnaires_response.reload }
          .to raise_error(ActiveRecord::RecordNotFound)
        expect(json).to eq('meta' => {})
      end
    end
  end
end
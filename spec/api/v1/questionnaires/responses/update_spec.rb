require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "questionnaires_responses#update", type: :request do
    subject(:make_request) do
      jsonapi_put "/api/v1/questionnaires/responses/#{questionnaires_response.id}", payload
    end

    describe 'basic update' do
      let!(:questionnaires_response) { create(:questionnaires_response) }

      let(:payload) do
        {
          data: {
            id: questionnaires_response.id.to_s,
            type: 'responses',
            attributes: {
              answer: 'new answer'
            }
          }
        }
      end

      # Replace 'xit' with 'it' after adding attributes
      xit 'updates the resource' do
        expect(Questionnaires.ResponseResource).to receive(:find).and_call_original
        expect {
          make_request
          expect(response.status).to eq(200), response.body
        }.to change { questionnaires_response.reload.attributes }
      end
    end
  end
end
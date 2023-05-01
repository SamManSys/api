require 'rails_helper'

RSpec.describe "collection_protocols#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/collection_protocols/#{collection_protocol.id}", payload
  end

  describe 'basic update' do
    let!(:collection_protocol) { create(:collection_protocol) }

    let(:payload) do
      {
        data: {
          id: collection_protocol.id.to_s,
          type: 'collection_protocols',
          attributes: {
            start_date: Date.yesterday
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(CollectionProtocolResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { collection_protocol.reload.attributes }
    end
  end
end

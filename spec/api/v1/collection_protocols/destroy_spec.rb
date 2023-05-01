require 'rails_helper'

RSpec.describe "collection_protocols#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/collection_protocols/#{collection_protocol.id}"
  end

  describe 'basic destroy' do
    let!(:collection_protocol) { create(:collection_protocol) }

    it 'updates the resource' do
      expect(CollectionProtocolResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { CollectionProtocol.count }.by(-1)
      expect { collection_protocol.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

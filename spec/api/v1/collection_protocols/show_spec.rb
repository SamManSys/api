require 'rails_helper'

RSpec.describe "collection_protocols#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/collection_protocols/#{collection_protocol.id}", params: params
  end

  describe 'basic fetch' do
    let!(:collection_protocol) { create(:collection_protocol) }

    it 'works' do
      expect(CollectionProtocolResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('collection_protocols')
      expect(d.id).to eq(collection_protocol.id)
    end
  end
end

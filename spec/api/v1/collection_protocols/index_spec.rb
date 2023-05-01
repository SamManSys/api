require 'rails_helper'

RSpec.describe "collection_protocols#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/collection_protocols", params: params
  end

  describe 'basic fetch' do
    let!(:collection_protocol1) { create(:collection_protocol) }
    let!(:collection_protocol2) { create(:collection_protocol) }

    it 'works' do
      expect(CollectionProtocolResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['collection_protocols'])
      expect(d.map(&:id)).to match_array([collection_protocol1.id, collection_protocol2.id])
    end
  end
end

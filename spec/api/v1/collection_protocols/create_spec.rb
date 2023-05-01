require 'rails_helper'

RSpec.describe "collection_protocols#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/collection_protocols", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:collection_protocol)
    end
    let(:payload) do
      {
        data: {
          type: 'collection_protocols',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CollectionProtocolResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { CollectionProtocol.count }.by(1)
    end
  end
end

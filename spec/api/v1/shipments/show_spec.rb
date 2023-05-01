require 'rails_helper'

RSpec.describe "shipments#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/shipments/#{shipment.id}", params: params
  end

  describe 'basic fetch' do
    let!(:shipment) { create(:shipment) }

    it 'works' do
      expect(ShipmentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('shipments')
      expect(d.id).to eq(shipment.id)
    end
  end
end

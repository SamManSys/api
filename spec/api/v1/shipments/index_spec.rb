require 'rails_helper'

RSpec.describe "shipments#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/shipments", params: params
  end

  describe 'basic fetch' do
    let!(:shipment1) { create(:shipment) }
    let!(:shipment2) { create(:shipment) }

    it 'works' do
      expect(ShipmentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['shipments'])
      expect(d.map(&:id)).to match_array([shipment1.id, shipment2.id])
    end
  end
end

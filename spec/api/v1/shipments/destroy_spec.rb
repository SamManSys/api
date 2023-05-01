require 'rails_helper'

RSpec.describe "shipments#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/shipments/#{shipment.id}"
  end

  describe 'basic destroy' do
    let!(:shipment) { create(:shipment) }

    it 'updates the resource' do
      expect(ShipmentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Shipment.count }.by(-1)
      expect { shipment.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

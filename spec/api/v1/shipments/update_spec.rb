require 'rails_helper'

RSpec.describe "shipments#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/shipments/#{shipment.id}", payload
  end

  describe 'basic update' do
    let!(:shipment) { create(:shipment) }

    let(:payload) do
      {
        data: {
          id: shipment.id.to_s,
          type: 'shipments',
          attributes: {
            name: "Meh"
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(ShipmentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { shipment.reload.attributes }
    end
  end
end

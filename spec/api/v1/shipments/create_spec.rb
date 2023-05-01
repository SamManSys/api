require 'rails_helper'

RSpec.describe "shipments#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/shipments", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:shipment)
    end
    let(:payload) do
      {
        data: {
          type: 'shipments',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ShipmentResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Shipment.count }.by(1)
    end
  end
end

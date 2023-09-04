require 'rails_helper'

RSpec.describe "shipment_samples#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/shipment_samples", payload
  end

  describe 'basic create' do
    let(:sample) do
      create :sample
    end
    let(:shipment) do
      create :shipment
    end
    let(:payload) do
      {
        data: {
          type: 'shipment_samples',
          relationships: {
            sample: {
              data: {
                type: 'samples',
                id: sample.id.to_s
              } 
            },
            shipment: {
              data: {
                id: shipment.id.to_s,
                type: 'shipments'
              }
            }          
          }
        }
      }
    end

    it 'works' do
      expect(ShipmentSampleResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ShipmentSample.count }.by(1)
    end
  end
end

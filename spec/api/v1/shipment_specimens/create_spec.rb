require 'rails_helper'

RSpec.describe "shipment_specimens#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/shipment_specimens", payload
  end

  describe 'basic create' do
    let(:specimen) do
      create :specimen
    end
    let(:shipment) do
      create :shipment
    end
    let(:payload) do
      {
        data: {
          type: 'shipment_specimens',
          relationships: {
            specimen: {
              data: {
                type: 'specimens',
                id: specimen.id.to_s
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
      expect(ShipmentSpecimenResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ShipmentSpecimen.count }.by(1)
    end
  end
end

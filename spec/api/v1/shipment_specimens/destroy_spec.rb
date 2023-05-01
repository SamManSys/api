require 'rails_helper'

RSpec.describe "shipment_specimens#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/shipment_specimens/#{@shipment_specimen.id}"
  end

  describe 'basic destroy' do
    before :each do
      specimen = create(:specimen)
      shipment = create(:shipment)
      @shipment_specimen = ShipmentSpecimen.create! specimen: specimen, shipment: shipment
    end

    it 'updates the resource' do
      expect(ShipmentSpecimenResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ShipmentSpecimen.count }.by(-1)
      expect { @shipment_specimen.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

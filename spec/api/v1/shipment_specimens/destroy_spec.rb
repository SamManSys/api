require 'rails_helper'

RSpec.describe "shipment_samples#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/shipment_samples/#{@shipment_sample.id}"
  end

  describe 'basic destroy' do
    before :each do
      sample = create(:sample)
      shipment = create(:shipment)
      @shipment_sample = ShipmentSample.create! sample: sample, shipment: shipment
    end

    it 'updates the resource' do
      expect(ShipmentSampleResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ShipmentSample.count }.by(-1)
      expect { @shipment_sample.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

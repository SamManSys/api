require 'rails_helper'

RSpec.describe ShipmentSampleResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      sample = create(:sample)
      shipment = create(:shipment)
      {
        data: {
          type: 'shipment_samples',
          attributes: attributes_for(:shipment_sample),
          relationships: {
            shipment: {
              data: {
                type: 'shipments',
                id: shipment.id.to_s
              }
            },
            sample: {
              data: {
                type: 'samples',
                id: sample.id.to_s
              }
            }
          }
        }
      }
    end

    let(:instance) do
      ShipmentSampleResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ShipmentSample.count }.by(1)
    end
  end

  describe 'destroying' do
    let!(:shipment_sample) { create(:shipment_sample) }

    let(:instance) do
      ShipmentSampleResource.find(id: shipment_sample.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ShipmentSample.count }.by(-1)
    end
  end
end

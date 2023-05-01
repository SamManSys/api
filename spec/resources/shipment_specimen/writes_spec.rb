require 'rails_helper'

RSpec.describe ShipmentSpecimenResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      specimen = create(:specimen)
      shipment = create(:shipment)
      {
        data: {
          type: 'shipment_specimens',
          attributes: attributes_for(:shipment_specimen),
          relationships: {
            shipment: {
              data: {
                type: 'shipments',
                id: shipment.id.to_s
              }
            },
            specimen: {
              data: {
                type: 'specimens',
                id: specimen.id.to_s
              }
            }
          }
        }
      }
    end

    let(:instance) do
      ShipmentSpecimenResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ShipmentSpecimen.count }.by(1)
    end
  end

  describe 'destroying' do
    let!(:shipment_specimen) { create(:shipment_specimen) }

    let(:instance) do
      ShipmentSpecimenResource.find(id: shipment_specimen.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ShipmentSpecimen.count }.by(-1)
    end
  end
end

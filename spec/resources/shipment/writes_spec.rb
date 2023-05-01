require 'rails_helper'

RSpec.describe ShipmentResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'shipments',
          attributes: attributes_for(:shipment)
        }
      }
    end

    let(:instance) do
      ShipmentResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Shipment.count }.by(1)
    end
  end

  describe 'updating' do
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

    let(:instance) do
      ShipmentResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { shipment.reload.name }.to('Meh')
    end
  end

  describe 'destroying' do
    let!(:shipment) { create(:shipment) }

    let(:instance) do
      ShipmentResource.find(id: shipment.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Shipment.count }.by(-1)
    end
  end
end

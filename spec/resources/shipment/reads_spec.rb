require 'rails_helper'

RSpec.describe ShipmentResource, type: :resource do
  describe 'serialization' do
    let!(:shipment) { create(:shipment) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(shipment.id)
      expect(data.jsonapi_type).to eq('shipments')
    end
  end

  describe 'filtering' do
    let!(:shipment1) { create(:shipment) }
    let!(:shipment2) { create(:shipment) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: shipment2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([shipment2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:shipment1) { create(:shipment) }
      let!(:shipment2) { create(:shipment) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            shipment1.id,
            shipment2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            shipment2.id,
            shipment1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

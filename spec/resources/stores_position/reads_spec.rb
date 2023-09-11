require 'rails_helper'

describe StoresPositionResource, type: :resource do
  describe 'serialization' do
    let!(:store_position) { create(:stores_position) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(store_position.id)
      expect(data.jsonapi_type).to eq('stores_positions')
    end
  end

  describe 'filtering' do
    let!(:store_position1) { create(:stores_position) }
    let!(:store_position2) { create(:stores_position) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: store_position2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([store_position2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:store_position1) { create(:stores_position) }
      let!(:store_position2) { create(:stores_position) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            store_position1.id,
            store_position2.id
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
            store_position2.id,
            store_position1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end


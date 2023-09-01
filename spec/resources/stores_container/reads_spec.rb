require 'rails_helper'

RSpec.describe StoresContainerResource, type: :resource do
  describe 'serialization' do
    let!(:store) { create(:stores_container) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(store.id)
      expect(data.jsonapi_type).to eq('stores_containers')
    end
  end

  describe 'filtering' do
    let!(:store1) { create(:stores_container) }
    let!(:store2) { create(:stores_container) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: store2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([store2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:store1) { create(:stores_container) }
      let!(:store2) { create(:stores_container) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            store1.id,
            store2.id
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
            store2.id,
            store1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

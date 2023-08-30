require 'rails_helper'

RSpec.describe Containers::StoreResource, type: :resource do
  describe 'serialization' do
    let!(:storage_container) { create(:storage_container) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(storage_container.id)
      expect(data.jsonapi_type).to eq('stores')
    end
  end

  describe 'filtering' do
    let!(:storage_container1) { create(:storage_container) }
    let!(:storage_container2) { create(:storage_container) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: storage_container2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([storage_container2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:storage_container1) { create(:storage_container) }
      let!(:storage_container2) { create(:storage_container) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            storage_container1.id,
            storage_container2.id
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
            storage_container2.id,
            storage_container1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

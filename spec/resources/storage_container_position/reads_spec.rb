require 'rails_helper'

RSpec.describe StorageContainerPositionResource, type: :resource do
  describe 'serialization' do
    let!(:storage_container_position) { create(:storage_container_position) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(storage_container_position.id)
      expect(data.jsonapi_type).to eq('storage_container_positions')
    end
  end

  describe 'filtering' do
    let!(:storage_container_position1) { create(:storage_container_position) }
    let!(:storage_container_position2) { create(:storage_container_position) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: storage_container_position2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([storage_container_position2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:storage_container_position1) { create(:storage_container_position) }
      let!(:storage_container_position2) { create(:storage_container_position) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            storage_container_position1.id,
            storage_container_position2.id
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
            storage_container_position2.id,
            storage_container_position1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

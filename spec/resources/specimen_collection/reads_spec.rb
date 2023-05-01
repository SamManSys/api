require 'rails_helper'

RSpec.describe SpecimenCollectionResource, type: :resource do
  describe 'serialization' do
    let!(:specimen_collection) { create(:specimen_collection) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(specimen_collection.id)
      expect(data.jsonapi_type).to eq('specimen_collections')
    end
  end

  describe 'filtering' do
    let!(:specimen_collection1) { create(:specimen_collection) }
    let!(:specimen_collection2) { create(:specimen_collection) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: specimen_collection2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([specimen_collection2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:specimen_collection1) { create(:specimen_collection) }
      let!(:specimen_collection2) { create(:specimen_collection) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            specimen_collection1.id,
            specimen_collection2.id
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
            specimen_collection2.id,
            specimen_collection1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

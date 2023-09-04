require 'rails_helper'

RSpec.describe SampleCollectionResource, type: :resource do
  describe 'serialization' do
    let!(:sample_collection) { create(:sample_collection) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(sample_collection.id)
      expect(data.jsonapi_type).to eq('sample_collections')
    end
  end

  describe 'filtering' do
    let!(:sample_collection1) { create(:sample_collection) }
    let!(:sample_collection2) { create(:sample_collection) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: sample_collection2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([sample_collection2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:sample_collection1) { create(:sample_collection) }
      let!(:sample_collection2) { create(:sample_collection) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            sample_collection1.id,
            sample_collection2.id
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
            sample_collection2.id,
            sample_collection1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

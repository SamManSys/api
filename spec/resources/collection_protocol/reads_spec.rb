require 'rails_helper'

RSpec.describe CollectionProtocolResource, type: :resource do
  describe 'serialization' do
    let!(:collection_protocol) { create(:collection_protocol) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(collection_protocol.id)
      expect(data.jsonapi_type).to eq('collection_protocols')
    end
  end

  describe 'filtering' do
    let!(:collection_protocol1) { create(:collection_protocol) }
    let!(:collection_protocol2) { create(:collection_protocol) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: collection_protocol2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([collection_protocol2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:collection_protocol1) { create(:collection_protocol) }
      let!(:collection_protocol2) { create(:collection_protocol) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            collection_protocol1.id,
            collection_protocol2.id
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
            collection_protocol2.id,
            collection_protocol1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

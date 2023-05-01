require 'rails_helper'

RSpec.describe StorageContainerTemplateResource, type: :resource do
  describe 'serialization' do
    let!(:storage_container_template) { create(:storage_container_template) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(storage_container_template.id)
      expect(data.jsonapi_type).to eq('storage_container_templates')
    end
  end

  describe 'filtering' do
    let!(:storage_container_template1) { create(:storage_container_template) }
    let!(:storage_container_template2) { create(:storage_container_template) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: storage_container_template2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([storage_container_template2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:storage_container_template1) { create(:storage_container_template) }
      let!(:storage_container_template2) { create(:storage_container_template) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            storage_container_template1.id,
            storage_container_template2.id
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
            storage_container_template2.id,
            storage_container_template1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

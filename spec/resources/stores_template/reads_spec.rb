require 'rails_helper'

RSpec.describe StoresTemplateResource, type: :resource do
  describe 'serialization' do
    let!(:stores_template) { create(:stores_template) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(stores_template.id)
      expect(data.jsonapi_type).to eq('stores_templates')
    end
  end

  describe 'filtering' do
    let!(:stores_template1) { create(:stores_template) }
    let!(:stores_template2) { create(:stores_template) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: stores_template2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([stores_template2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:stores_template1) { create(:stores_template) }
      let!(:stores_template2) { create(:stores_template) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            stores_template1.id,
            stores_template2.id
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
            stores_template2.id,
            stores_template1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

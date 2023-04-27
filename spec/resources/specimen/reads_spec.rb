require 'rails_helper'

RSpec.describe SpecimenResource, type: :resource do
  describe 'serialization' do
    let!(:specimen) { create(:specimen) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(specimen.id)
      expect(data.jsonapi_type).to eq('specimens')
    end
  end

  describe 'filtering' do
    let!(:specimen1) { create(:specimen) }
    let!(:specimen2) { create(:specimen) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: specimen2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([specimen2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:specimen1) { create(:specimen) }
      let!(:specimen2) { create(:specimen) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            specimen1.id,
            specimen2.id
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
            specimen2.id,
            specimen1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

require 'rails_helper'

RSpec.describe SampleResource, type: :resource do
  describe 'serialization' do
    let!(:sample) { create(:sample) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(sample.id)
      expect(data.jsonapi_type).to eq('samples')
    end
  end

  describe 'filtering' do
    let!(:sample1) { create(:sample) }
    let!(:sample2) { create(:sample) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: sample2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([sample2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:sample1) { create(:sample) }
      let!(:sample2) { create(:sample) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            sample1.id,
            sample2.id
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
            sample2.id,
            sample1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

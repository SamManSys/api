require 'rails_helper'

RSpec.describe PatientResource, type: :resource do
  describe 'serialization' do
    let!(:patient) { create(:patient) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(patient.id)
      expect(data.jsonapi_type).to eq('patients')
    end
  end

  describe 'filtering' do
    let!(:patient1) { create(:patient) }
    let!(:patient2) { create(:patient) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: patient2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([patient2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:patient1) { create(:patient) }
      let!(:patient2) { create(:patient) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            patient1.id,
            patient2.id
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
            patient2.id,
            patient1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

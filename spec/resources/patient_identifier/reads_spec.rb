require 'rails_helper'

RSpec.describe PatientIdentifierResource, type: :resource do
  describe 'serialization' do
    let!(:patient_identifier) { create(:patient_identifier) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(patient_identifier.id)
      expect(data.jsonapi_type).to eq('patient_identifiers')
    end
  end

  describe 'filtering' do
    let!(:patient_identifier1) { create(:patient_identifier) }
    let!(:patient_identifier2) { create(:patient_identifier) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: patient_identifier2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([patient_identifier2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:patient_identifier1) { create(:patient_identifier) }
      let!(:patient_identifier2) { create(:patient_identifier) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            patient_identifier1.id,
            patient_identifier2.id
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
            patient_identifier2.id,
            patient_identifier1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

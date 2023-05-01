require 'rails_helper'

RSpec.describe RegistrationToCpResource, type: :resource do
  describe 'serialization' do
    let!(:registration_to_cp) { create(:registration_to_cp) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(registration_to_cp.id)
      expect(data.jsonapi_type).to eq('registration_to_cps')
    end
  end

  describe 'filtering' do
    let!(:registration_to_cp1) { create(:registration_to_cp) }
    let!(:registration_to_cp2) { create(:registration_to_cp) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: registration_to_cp2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([registration_to_cp2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:registration_to_cp1) { create(:registration_to_cp) }
      let!(:registration_to_cp2) { create(:registration_to_cp) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            registration_to_cp1.id,
            registration_to_cp2.id
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
            registration_to_cp2.id,
            registration_to_cp1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

require 'rails_helper'

RSpec.describe QuestionnairesFormResource, type: :resource do
  describe 'serialization' do
    let!(:questionnaires_form) { create(:questionnaires_form) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(questionnaires_form.id)
      expect(data.jsonapi_type).to eq('questionnaires_forms')
    end
  end

  describe 'filtering' do
    let!(:questionnaires_form1) { create(:questionnaires_form) }
    let!(:questionnaires_form2) { create(:questionnaires_form) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: questionnaires_form2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([questionnaires_form2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:questionnaires_form1) { create(:questionnaires_form) }
      let!(:questionnaires_form2) { create(:questionnaires_form) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            questionnaires_form1.id,
            questionnaires_form2.id
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
            questionnaires_form2.id,
            questionnaires_form1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

require 'rails_helper'

RSpec.describe QuestionnairesTemplateResource, type: :resource do
  describe 'serialization' do
    let!(:questionnaires_template) { create(:questionnaires_template) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(questionnaires_template.id)
      expect(data.jsonapi_type).to eq('questionnaires_templates')
    end
  end

  describe 'filtering' do
    let!(:questionnaires_template1) { create(:questionnaires_template) }
    let!(:questionnaires_template2) { create(:questionnaires_template) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: questionnaires_template2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([questionnaires_template2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:questionnaires_template1) { create(:questionnaires_template) }
      let!(:questionnaires_template2) { create(:questionnaires_template) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            questionnaires_template1.id,
            questionnaires_template2.id
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
            questionnaires_template2.id,
            questionnaires_template1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

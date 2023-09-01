require 'rails_helper'

RSpec.describe QuestionnairesResponseResource, type: :resource do
  describe 'serialization' do
    let!(:questionnaires_response) { create(:questionnaires_response) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(questionnaires_response.id)
      expect(data.jsonapi_type).to eq('questionnaires_responses')
    end
  end

  describe 'filtering' do
    let!(:questionnaires_response1) { create(:questionnaires_response) }
    let!(:questionnaires_response2) { create(:questionnaires_response) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: questionnaires_response2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([questionnaires_response2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:questionnaires_response1) { create(:questionnaires_response) }
      let!(:questionnaires_response2) { create(:questionnaires_response) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            questionnaires_response1.id,
            questionnaires_response2.id
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
            questionnaires_response2.id,
            questionnaires_response1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

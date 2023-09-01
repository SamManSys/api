require 'rails_helper'

RSpec.describe QuestionnairesQuestionResource, type: :resource do
  describe 'serialization' do
    let!(:questionnaires_question) { create(:questionnaires_question) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(questionnaires_question.id)
      expect(data.jsonapi_type).to eq('questionnaires_questions')
    end
  end

  describe 'filtering' do
    let!(:questionnaires_question1) { create(:questionnaires_question) }
    let!(:questionnaires_question2) { create(:questionnaires_question) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: questionnaires_question2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([questionnaires_question2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:questionnaires_question1) { create(:questionnaires_question) }
      let!(:questionnaires_question2) { create(:questionnaires_question) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            questionnaires_question1.id,
            questionnaires_question2.id
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
            questionnaires_question2.id,
            questionnaires_question1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

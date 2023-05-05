require 'rails_helper'

RSpec.describe ConsentQuestionnaireQuestionResource, type: :resource do
  describe 'serialization' do
    let!(:consent_questionnaire_question) { create(:consent_questionnaire_question) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(consent_questionnaire_question.id)
      expect(data.jsonapi_type).to eq('consent_questionnaire_questions')
    end
  end

  describe 'filtering' do
    let!(:consent_questionnaire_question1) { create(:consent_questionnaire_question) }
    let!(:consent_questionnaire_question2) { create(:consent_questionnaire_question) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: consent_questionnaire_question2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([consent_questionnaire_question2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:consent_questionnaire_question1) { create(:consent_questionnaire_question) }
      let!(:consent_questionnaire_question2) { create(:consent_questionnaire_question) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            consent_questionnaire_question1.id,
            consent_questionnaire_question2.id
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
            consent_questionnaire_question2.id,
            consent_questionnaire_question1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

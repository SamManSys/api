require 'rails_helper'

RSpec.describe CompletedConsentQuestionnaireResource, type: :resource do
  describe 'serialization' do
    let!(:completed_consent_questionnaire) { create(:completed_consent_questionnaire) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(completed_consent_questionnaire.id)
      expect(data.jsonapi_type).to eq('completed_consent_questionnaires')
    end
  end

  describe 'filtering' do
    let!(:completed_consent_questionnaire1) { create(:completed_consent_questionnaire) }
    let!(:completed_consent_questionnaire2) { create(:completed_consent_questionnaire) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: completed_consent_questionnaire2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([completed_consent_questionnaire2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:completed_consent_questionnaire1) { create(:completed_consent_questionnaire) }
      let!(:completed_consent_questionnaire2) { create(:completed_consent_questionnaire) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            completed_consent_questionnaire1.id,
            completed_consent_questionnaire2.id
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
            completed_consent_questionnaire2.id,
            completed_consent_questionnaire1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

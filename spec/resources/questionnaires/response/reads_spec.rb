require 'rails_helper'

RSpec.describe Questionnaires::ResponseResource, type: :resource do
  describe 'serialization' do
    let!(:consent_questionnaire_response) { create(:consent_questionnaire_response) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(consent_questionnaire_response.id)
      expect(data.jsonapi_type).to eq('responses')
    end
  end

  describe 'filtering' do
    let!(:consent_questionnaire_response1) { create(:consent_questionnaire_response) }
    let!(:consent_questionnaire_response2) { create(:consent_questionnaire_response) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: consent_questionnaire_response2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([consent_questionnaire_response2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:consent_questionnaire_response1) { create(:consent_questionnaire_response) }
      let!(:consent_questionnaire_response2) { create(:consent_questionnaire_response) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            consent_questionnaire_response1.id,
            consent_questionnaire_response2.id
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
            consent_questionnaire_response2.id,
            consent_questionnaire_response1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

require 'rails_helper'

RSpec.describe ConsentQuestionnaireTemplateResource, type: :resource do
  describe 'serialization' do
    let!(:consent_questionnaire_template) { create(:consent_questionnaire_template) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(consent_questionnaire_template.id)
      expect(data.jsonapi_type).to eq('consent_questionnaire_templates')
    end
  end

  describe 'filtering' do
    let!(:consent_questionnaire_template1) { create(:consent_questionnaire_template) }
    let!(:consent_questionnaire_template2) { create(:consent_questionnaire_template) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: consent_questionnaire_template2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([consent_questionnaire_template2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:consent_questionnaire_template1) { create(:consent_questionnaire_template) }
      let!(:consent_questionnaire_template2) { create(:consent_questionnaire_template) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            consent_questionnaire_template1.id,
            consent_questionnaire_template2.id
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
            consent_questionnaire_template2.id,
            consent_questionnaire_template1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

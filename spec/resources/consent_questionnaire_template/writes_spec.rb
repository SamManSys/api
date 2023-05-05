require 'rails_helper'

RSpec.describe ConsentQuestionnaireTemplateResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'consent_questionnaire_templates',
          attributes: attributes_for(:consent_questionnaire_template)
        }
      }
    end

    let(:instance) do
      ConsentQuestionnaireTemplateResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ConsentQuestionnaireTemplate.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:consent_questionnaire_template) { create(:consent_questionnaire_template) }

    let(:payload) do
      {
        data: {
          id: consent_questionnaire_template.id.to_s,
          type: 'consent_questionnaire_templates',
          attributes: { 
            name: 'Meh'
          } 
        }
      }
    end

    let(:instance) do
      ConsentQuestionnaireTemplateResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { consent_questionnaire_template.reload.name }.to('Meh')
    end
  end

  describe 'destroying' do
    let!(:consent_questionnaire_template) { create(:consent_questionnaire_template) }

    let(:instance) do
      ConsentQuestionnaireTemplateResource.find(id: consent_questionnaire_template.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ConsentQuestionnaireTemplate.count }.by(-1)
    end
  end
end

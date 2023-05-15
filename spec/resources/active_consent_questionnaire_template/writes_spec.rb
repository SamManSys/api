require 'rails_helper'

RSpec.describe ActiveConsentQuestionnaireTemplateResource, type: :resource do
  describe 'creating' do
    let(:collection_protocol) do
      create(:collection_protocol)
    end

    let(:consent_questionnaire_template) do
      create(:consent_questionnaire_template)
    end

    let(:params) do
      attributes_for(:active_consent_questionnaire_template)
    end

    let(:payload) do
      {
        data: {
          type: 'active_consent_questionnaire_templates',
          attributes: params,
          relationships: {
            collection_protocol: {
              data: {
                type: 'collection_protocols',
                id: collection_protocol.id.to_s
              }
            },
            consent_questionnaire_template: {
              data: {
                type: 'consent_questionnaire_templates',
                id: consent_questionnaire_template.id.to_s
              }
            }
          }
            
        }
      }
    end

    let(:instance) do
      ActiveConsentQuestionnaireTemplateResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ActiveConsentQuestionnaireTemplate.count }.by(1)
    end
  end

  describe 'destroying' do
    let!(:active_consent_questionnaire_template) { create(:active_consent_questionnaire_template) }

    let(:instance) do
      ActiveConsentQuestionnaireTemplateResource.find(id: active_consent_questionnaire_template.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ActiveConsentQuestionnaireTemplate.count }.by(-1)
    end
  end
end

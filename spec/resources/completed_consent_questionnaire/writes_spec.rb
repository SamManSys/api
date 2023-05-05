require 'rails_helper'

RSpec.describe CompletedConsentQuestionnaireResource, type: :resource do
  describe 'creating' do
    let(:registration_to_cp) {
      create(:registration_to_cp)
    }
    let(:payload) do
      {
        data: {
          type: 'completed_consent_questionnaires',
          attributes: attributes_for(:completed_consent_questionnaire),
          relationships: {
            registration_to_cp: {
              data: {
                type: 'registration_to_cps',
                id: registration_to_cp.id.to_s
              }
            }
          }
        }
      }
    end

    let(:instance) do
      CompletedConsentQuestionnaireResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { CompletedConsentQuestionnaire.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:completed_consent_questionnaire) { create(:completed_consent_questionnaire) }
    let(:full_name) do
      Faker::Name.name
    end
    let(:payload) do
      {
        data: {
          id: completed_consent_questionnaire.id.to_s,
          type: 'completed_consent_questionnaires',
          attributes: { 
            witness_name: full_name
          }
        }
      }
    end

    let(:instance) do
      CompletedConsentQuestionnaireResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { completed_consent_questionnaire.reload.witness_name }.to(full_name)
    end
  end

  describe 'destroying' do
    let!(:completed_consent_questionnaire) { create(:completed_consent_questionnaire) }

    let(:instance) do
      CompletedConsentQuestionnaireResource.find(id: completed_consent_questionnaire.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { CompletedConsentQuestionnaire.count }.by(-1)
    end
  end
end

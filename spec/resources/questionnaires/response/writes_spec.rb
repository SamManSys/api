require 'rails_helper'

RSpec.describe Questionnaires::ResponseResource, type: :resource do
  describe 'creating' do
    let(:consent_questionnaire_question) do
      create(:consent_questionnaire_question)
    end
    let(:completed_consent_questionnaire) do
      create(:completed_consent_questionnaire)
    end

    let(:params) do
      attributes_for(:consent_questionnaire_response)
    end
    let(:payload) do
      {
        data: {
          type: 'responses',
          attributes: params,
          relationships: {
            question: {
              data: {
                type: 'questions',
                id: consent_questionnaire_question.id.to_s
              }               
            },
            form: {
              data: {
                type: 'forms',
                id: completed_consent_questionnaire.id.to_s  
              }
            }
          }
        }
      }
    end

    let(:instance) do
      Questionnaires::ResponseResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ConsentQuestionnaireResponse.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:consent_questionnaire_response) { create(:consent_questionnaire_response) }

    let(:payload) do
      {
        data: {
          id: consent_questionnaire_response.id.to_s,
          type: 'responses',
          attributes: { 
            answer: 'new answer'
          }
        }
      }
    end

    let(:instance) do
      Questionnaires::ResponseResource.find(payload)
    end

    it 'works' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { consent_questionnaire_response.reload.answer }.to('new answer')
    end
  end

  describe 'destroying' do
    let!(:consent_questionnaire_response) { create(:consent_questionnaire_response) }

    let(:instance) do
      Questionnaires::ResponseResource.find(id: consent_questionnaire_response.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ConsentQuestionnaireResponse.count }.by(-1)
    end
  end
end

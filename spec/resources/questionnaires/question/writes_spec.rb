require 'rails_helper'

RSpec.describe Questionnaires::QuestionResource, type: :resource do
  describe 'creating' do
    let(:consent_questionnaire_template) do
      create(:consent_questionnaire_template)
    end
    let(:payload) do
      {
        data: {
          type: 'questions',
          attributes: attributes_for(:consent_questionnaire_question),
          relationships: {
            template: {
              data: {
                type: 'templates',
                id: consent_questionnaire_template.id.to_s
              }
            }
          }
        }
      }
    end

    let(:instance) do
      Questionnaires::QuestionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ConsentQuestionnaireQuestion.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:consent_questionnaire_question) { create(:consent_questionnaire_question) }

    let(:payload) do
      {
        data: {
          id: consent_questionnaire_question.id.to_s,
          type: 'questions',
          attributes: { 
            question: 'Meh'
          } 
        }
      }
    end

    let(:instance) do
      Questionnaires::QuestionResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { consent_questionnaire_question.reload.question }.to('Meh')
    end
  end

  describe 'destroying' do
    let!(:consent_questionnaire_question) { create(:consent_questionnaire_question) }

    let(:instance) do
      Questionnaires::QuestionResource.find(id: consent_questionnaire_question.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ConsentQuestionnaireQuestion.count }.by(-1)
    end
  end
end

require 'rails_helper'

RSpec.describe QuestionnairesQuestionResource, type: :resource do
  describe 'creating' do
    let(:questionnaires_template) do
      create(:questionnaires_template)
    end
    let(:payload) do
      {
        data: {
          type: 'questionnaires_questions',
          attributes: attributes_for(:questionnaires_question),
          relationships: {
            questionnaires_template: {
              data: {
                type: 'questionnaires_templates',
                id: questionnaires_template.id.to_s
              }
            }
          }
        }
      }
    end

    let(:instance) do
      QuestionnairesQuestionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { QuestionnairesQuestion.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:questionnaires_question) { create(:questionnaires_question) }

    let(:payload) do
      {
        data: {
          id: questionnaires_question.id.to_s,
          type: 'questionnaires_questions',
          attributes: { 
            question: 'Meh'
          } 
        }
      }
    end

    let(:instance) do
      QuestionnairesQuestionResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { questionnaires_question.reload.question }.to('Meh')
    end
  end

  describe 'destroying' do
    let!(:questionnaires_question) { create(:questionnaires_question) }

    let(:instance) do
      QuestionnairesQuestionResource.find(id: questionnaires_question.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { QuestionnairesQuestion.count }.by(-1)
    end
  end
end

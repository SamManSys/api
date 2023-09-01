require 'rails_helper'

RSpec.describe QuestionnairesResponseResource, type: :resource do
  describe 'creating' do
    let(:questionnaires_question) do
      create(:questionnaires_question)
    end
    let(:questionnaires_form) do
      create(:questionnaires_form)
    end

    let(:params) do
      attributes_for(:questionnaires_response)
    end
    let(:payload) do
      {
        data: {
          type: 'questionnaires_responses',
          attributes: params,
          relationships: {
            questionnaires_question: {
              data: {
                type: 'questionnaires_questions',
                id: questionnaires_question.id.to_s
              }               
            },
            questionnaires_form: {
              data: {
                type: 'questionnaires_forms',
                id: questionnaires_form.id.to_s  
              }
            }
          }
        }
      }
    end

    let(:instance) do
      QuestionnairesResponseResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { QuestionnairesResponse.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:questionnaires_response) { create(:questionnaires_response) }

    let(:payload) do
      {
        data: {
          id: questionnaires_response.id.to_s,
          type: 'questionnaires_responses',
          attributes: { 
            answer: 'new answer'
          }
        }
      }
    end

    let(:instance) do
      QuestionnairesResponseResource.find(payload)
    end

    it 'works' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { questionnaires_response.reload.answer }.to('new answer')
    end
  end

  describe 'destroying' do
    let!(:questionnaires_response) { create(:questionnaires_response) }

    let(:instance) do
      QuestionnairesResponseResource.find(id: questionnaires_response.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { QuestionnairesResponse.count }.by(-1)
    end
  end
end

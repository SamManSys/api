require 'rails_helper'

RSpec.describe QuestionnairesTemplateResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'questionnaires_templates',
          attributes: attributes_for(:questionnaires_template)
        }
      }
    end

    let(:instance) do
      QuestionnairesTemplateResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { QuestionnairesTemplate.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:questionnaires_template) { create(:questionnaires_template) }

    let(:payload) do
      {
        data: {
          id: questionnaires_template.id.to_s,
          type: 'questionnaires_templates',
          attributes: { 
            name: 'Meh'
          } 
        }
      }
    end

    let(:instance) do
      QuestionnairesTemplateResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { questionnaires_template.reload.name }.to('Meh')
    end
  end

  describe 'destroying' do
    let!(:questionnaires_template) { create(:questionnaires_template) }

    let(:instance) do
      QuestionnairesTemplateResource.find(id: questionnaires_template.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { QuestionnairesTemplate.count }.by(-1)
    end
  end
end

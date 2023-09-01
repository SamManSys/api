require 'rails_helper'

RSpec.describe QuestionnairesFormResource, type: :resource do
  describe 'creating' do
    let(:registration_to_cp) {
      create(:registration_to_cp)
    }
    let(:payload) do
      {
        data: {
          type: 'forms',
          attributes: attributes_for(:questionnaires_form),
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
      QuestionnairesFormResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { QuestionnairesForm.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:questionnaires_form) { create(:questionnaires_form) }
    let(:full_name) do
      Faker::Name.name
    end
    let(:payload) do
      {
        data: {
          id: questionnaires_form.id.to_s,
          type: 'questionnaires_forms',
          attributes: { 
            witness_name: full_name
          }
        }
      }
    end

    let(:instance) do
      QuestionnairesFormResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { questionnaires_form.reload.witness_name }.to(full_name)
    end
  end

  describe 'destroying' do
    let!(:questionnaires_form) { create(:questionnaires_form) }

    let(:instance) do
      QuestionnairesFormResource.find(id: questionnaires_form.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { QuestionnairesForm.count }.by(-1)
    end
  end
end

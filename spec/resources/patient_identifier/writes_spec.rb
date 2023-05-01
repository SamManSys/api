require 'rails_helper'

RSpec.describe PatientIdentifierResource, type: :resource do
  describe 'creating' do
    let(:patient) do
      create(:patient)
    end

    let(:payload) do
      {
        data: {
          type: 'patient_identifiers',
          attributes: attributes_for(:patient_identifier),
          relationships: {
            patient: {
              data: {
                type: 'patient',
                id: patient.id.to_s
              }
            }
          }
        }
      }
    end

    let(:instance) do
      PatientIdentifierResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { PatientIdentifier.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:patient_identifier) { create(:patient_identifier) }

    let(:payload) do
      {
        data: {
          id: patient_identifier.id.to_s,
          type: 'patient_identifiers',
          attributes: { 
            identifier: 'bar'
          } 
        }
      }
    end

    let(:instance) do
      PatientIdentifierResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { patient_identifier.reload.identifier }.to('bar')
    end
  end

  describe 'destroying' do
    let!(:patient_identifier) { create(:patient_identifier) }

    let(:instance) do
      PatientIdentifierResource.find(id: patient_identifier.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { PatientIdentifier.count }.by(-1)
    end
  end
end

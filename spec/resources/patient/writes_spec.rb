require 'rails_helper'

RSpec.describe PatientResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'patients',
          attributes: attributes_for(:patient)
        }
      }
    end

    let(:instance) do
      PatientResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Patient.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:patient) { create(:patient) }
    let(:surname) { Faker::Name.last_name }
    let(:payload) do
      {
        data: {
          id: patient.id.to_s,
          type: 'patients',
          attributes: { 
            firstname: Faker::Name.first_name,
            surname: surname
          } 
        }
      }
    end

    let(:instance) do
      PatientResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { patient.reload.firstname }
       .and change { patient.surname }.to(surname) 
    end
  end

  describe 'destroying' do
    let!(:patient) { create(:patient) }

    let(:instance) do
      PatientResource.find(id: patient.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Patient.count }.by(-1)
    end
  end
end

require 'rails_helper'

RSpec.describe RegistrationToCpResource, type: :resource do
  describe 'creating' do
    let(:collection_protocol) do
      create(:collection_protocol)
    end

    let(:payload) do
      {
        data: {
          type: 'registration_to_cps',
          attributes: attributes_for(:registration_to_cp),
          relationships: {
            collection_protocol: {
              data: {
                type: 'collection_protocols',
                id: collection_protocol.id.to_s
              }
            }
          }
        }
      }
    end

    let(:instance) do
      RegistrationToCpResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { RegistrationToCp.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:registration_to_cp) { create(:registration_to_cp) }

    let(:payload) do
      {
        data: {
          id: registration_to_cp.id.to_s,
          type: 'registration_to_cps',
          attributes: { 
            date: Date.yesterday,
            registration_identifier: 'bar'
          } 
        }
      }
    end

    let(:instance) do
      RegistrationToCpResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { registration_to_cp.reload.date }
       .and change { registration_to_cp.registration_identifier }.to('bar') 
    end
  end

  describe 'destroying' do
    let!(:registration_to_cp) { create(:registration_to_cp) }

    let(:instance) do
      RegistrationToCpResource.find(id: registration_to_cp.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { RegistrationToCp.count }.by(-1)
    end
  end
end

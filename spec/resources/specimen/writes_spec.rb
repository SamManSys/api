require 'rails_helper'

RSpec.describe SpecimenResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'specimens',
          attributes: attributes_for(:specimen)
        }
      }
    end

    let(:instance) do
      SpecimenResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Specimen.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:specimen) { create(:specimen) }

    let(:payload) do
      {
        data: {
          id: specimen.id.to_s,
          type: 'specimens',
          attributes: { 
            label: "bar"
          }
        }
      }
    end

    let(:instance) do
      SpecimenResource.find(payload)
    end

    it 'works' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { specimen.reload.label }.to('bar')
    end
  end

  describe 'destroying' do
    let!(:specimen) { create(:specimen) }

    let(:instance) do
      SpecimenResource.find(id: specimen.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Specimen.count }.by(-1)
    end
  end
end

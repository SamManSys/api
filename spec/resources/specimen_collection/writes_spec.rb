require 'rails_helper'

RSpec.describe SpecimenCollectionResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'specimen_collections',
          attributes: attributes_for(:specimen_collection)
        }
      }
    end

    let(:instance) do
      SpecimenCollectionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { SpecimenCollection.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:specimen_collection) { create(:specimen_collection) }

    let(:payload) do
      {
        data: {
          id: specimen_collection.id.to_s,
          type: 'specimen_collections',
          attributes: { 
            study_point_name: "Meh"
          } 
        }
      }
    end

    let(:instance) do
      SpecimenCollectionResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { specimen_collection.reload.study_point_name }.to('Meh') 
    end
  end

  describe 'destroying' do
    let!(:specimen_collection) { create(:specimen_collection) }

    let(:instance) do
      SpecimenCollectionResource.find(id: specimen_collection.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { SpecimenCollection.count }.by(-1)
    end
  end
end

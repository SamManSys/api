require 'rails_helper'

RSpec.describe SampleCollectionResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'sample_collections',
          attributes: attributes_for(:sample_collection)
        }
      }
    end

    let(:instance) do
      SampleCollectionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { SampleCollection.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:sample_collection) { create(:sample_collection) }

    let(:payload) do
      {
        data: {
          id: sample_collection.id.to_s,
          type: 'sample_collections',
          attributes: { 
            study_point_name: "Meh"
          } 
        }
      }
    end

    let(:instance) do
      SampleCollectionResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { sample_collection.reload.study_point_name }.to('Meh') 
    end
  end

  describe 'destroying' do
    let!(:sample_collection) { create(:sample_collection) }

    let(:instance) do
      SampleCollectionResource.find(id: sample_collection.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { SampleCollection.count }.by(-1)
    end
  end
end

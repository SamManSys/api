require 'rails_helper'

RSpec.describe SampleResource, type: :resource do
  describe 'creating' do
    let(:specimen_collection) { create(:specimen_collection) }
    let(:params) do
      attributes_for(:specimen)
    end
    let(:payload) do
      {
        data: {
          type: 'samples',
          attributes: params,
          relationships: {
            specimen_collection: {
              data: {
                type: 'specimen_collections',
                id: specimen_collection.id.to_s
              }
            }
          }
        }
      }
    end

    let(:instance) do
      SampleResource.build(payload)
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
          type: 'samples',
          attributes: { 
            label: "bar"
          }
        }
      }
    end

    let(:instance) do
      SampleResource.find(payload)
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
      SampleResource.find(id: specimen.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Specimen.count }.by(-1)
    end
  end
end

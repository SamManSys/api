require 'rails_helper'

RSpec.describe SampleResource, type: :resource do
  describe 'creating' do
    let(:sample_collection) { create(:sample_collection) }
    let(:params) do
      attributes_for(:sample)
    end
    let(:payload) do
      {
        data: {
          type: 'samples',
          attributes: params,
          relationships: {
            sample_collection: {
              data: {
                type: 'sample_collections',
                id: sample_collection.id.to_s
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
      }.to change { Sample.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:sample) { create(:sample) }

    let(:payload) do
      {
        data: {
          id: sample.id.to_s,
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
      }.to change { sample.reload.label }.to('bar')
    end
  end

  describe 'destroying' do
    let!(:sample) { create(:sample) }

    let(:instance) do
      SampleResource.find(id: sample.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Sample.count }.by(-1)
    end
  end
end

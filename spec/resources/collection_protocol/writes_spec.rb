require 'rails_helper'

RSpec.describe CollectionProtocolResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'collection_protocols',
          attributes: attributes_for(:collection_protocol)
        }
      }
    end

    let(:instance) do
      CollectionProtocolResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { CollectionProtocol.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:collection_protocol) { create(:collection_protocol) }

    let(:payload) do
      {
        data: {
          id: collection_protocol.id.to_s,
          type: 'collection_protocols',
          attributes: { 
            start_date: Date.yesterday
          } 
        }
      }
    end

    let(:instance) do
      CollectionProtocolResource.find(payload)
    end

    it 'works' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { collection_protocol.reload.start_date }.to(Date.yesterday) 
    end
  end

  describe 'destroying' do
    let!(:collection_protocol) { create(:collection_protocol) }

    let(:instance) do
      CollectionProtocolResource.find(id: collection_protocol.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { CollectionProtocol.count }.by(-1)
    end
  end
end

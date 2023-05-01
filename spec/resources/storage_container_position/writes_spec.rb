require 'rails_helper'

RSpec.describe StorageContainerPositionResource, type: :resource do
  describe 'creating' do
    let(:storage_container) {
      create(:storage_container)
    }
    let(:payload) do
      {
        data: {
          type: 'storage_container_positions',
          attributes: attributes_for(:storage_container_position),
          relationships: {
            storage_container: {
              data: {
                type: 'storage_containers',
                id: storage_container.id.to_s
              }
            }
          }
        }
      }
    end

    let(:instance) do
      StorageContainerPositionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { StorageContainerPosition.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:storage_container_position) { create(:storage_container_position) }

    let(:payload) do
      {
        data: {
          id: storage_container_position.id.to_s,
          type: 'storage_container_positions',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StorageContainerPositionResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { storage_container_position.reload.updated_at }
      # .and change { storage_container_position.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:storage_container_position) { create(:storage_container_position) }

    let(:instance) do
      StorageContainerPositionResource.find(id: storage_container_position.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { StorageContainerPosition.count }.by(-1)
    end
  end
end

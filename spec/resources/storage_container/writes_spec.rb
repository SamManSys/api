require 'rails_helper'

RSpec.describe StorageContainerResource, type: :resource do
  describe 'creating' do
    let(:storage_container_template) {
      create(:storage_container_template)
    }    
    let(:payload) do
      {
        data: {
          type: 'storage_containers',
          attributes: attributes_for(:storage_container),
          relationships: {
            storage_container_template: {
              data: {
                type: 'storage_container_templates',
                id: storage_container_template.id.to_s
              }
            }
          }
        }
      }
    end

    let(:instance) do
      StorageContainerResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { StorageContainer.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:storage_container) { create(:storage_container) }

    let(:payload) do
      {
        data: {
          id: storage_container.id.to_s,
          type: 'storage_containers',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StorageContainerResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { storage_container.reload.updated_at }
      # .and change { storage_container.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:storage_container) { create(:storage_container) }

    let(:instance) do
      StorageContainerResource.find(id: storage_container.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { StorageContainer.count }.by(-1)
    end
  end
end

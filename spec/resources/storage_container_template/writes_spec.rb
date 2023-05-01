require 'rails_helper'

RSpec.describe StorageContainerTemplateResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'storage_container_templates',
          attributes: attributes_for(:storage_container_template)
        }
      }
    end

    let(:instance) do
      StorageContainerTemplateResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { StorageContainerTemplate.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:storage_container_template) { create(:storage_container_template) }

    let(:payload) do
      {
        data: {
          id: storage_container_template.id.to_s,
          type: 'storage_container_templates',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StorageContainerTemplateResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { storage_container_template.reload.updated_at }
      # .and change { storage_container_template.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:storage_container_template) { create(:storage_container_template) }

    let(:instance) do
      StorageContainerTemplateResource.find(id: storage_container_template.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { StorageContainerTemplate.count }.by(-1)
    end
  end
end

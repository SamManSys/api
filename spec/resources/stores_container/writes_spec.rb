require 'rails_helper'

RSpec.describe StoresContainerResource, type: :resource do
  describe 'creating' do
    let(:stores_template) {
      create(:stores_template)
    }    
    let(:payload) do
      {
        data: {
          type: 'stores_containers',
          attributes: attributes_for(:stores_container),
          relationships: {
            stores_template: {
              data: {
                type: 'stores_templates',
                id: stores_template.id.to_s
              }
            }
          }
        }
      }
    end

    let(:instance) do
      StoresContainerResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { StoresContainer.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:store) { create(:stores_container) }

    let(:payload) do
      {
        data: {
          id: store.id.to_s,
          type: 'stores_containers',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StoresContainerResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { store.reload.updated_at }
      # .and change { store.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:store) { create(:stores_container) }

    let(:instance) do
      StoresContainerResource.find(id: store.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { StoresContainer.count }.by(-1)
    end
  end
end

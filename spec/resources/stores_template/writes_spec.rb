require 'rails_helper'

RSpec.describe StoresTemplateResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'stores_templates',
          attributes: attributes_for(:stores_template)
        }
      }
    end

    let(:instance) do
      StoresTemplateResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { StoresTemplate.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:stores_template) { create(:stores_template) }

    let(:payload) do
      {
        data: {
          id: stores_template.id.to_s,
          type: 'stores_templates',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StoresTemplateResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { stores_template.reload.updated_at }
      # .and change { stores_template.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:stores_template) { create(:stores_template) }

    let(:instance) do
      StoresTemplateResource.find(id: stores_template.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { StoresTemplate.count }.by(-1)
    end
  end
end

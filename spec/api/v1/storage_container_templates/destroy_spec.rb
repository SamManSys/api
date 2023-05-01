require 'rails_helper'

RSpec.describe "storage_container_templates#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/storage_container_templates/#{storage_container_template.id}"
  end

  describe 'basic destroy' do
    let!(:storage_container_template) { create(:storage_container_template) }

    it 'updates the resource' do
      expect(StorageContainerTemplateResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { StorageContainerTemplate.count }.by(-1)
      expect { storage_container_template.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

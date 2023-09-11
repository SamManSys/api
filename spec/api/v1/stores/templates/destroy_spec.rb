require 'rails_helper'

describe "stores_templates#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/stores_templates/#{storage_container_template.id}"
  end

  describe 'basic destroy' do
    let!(:storage_container_template) { create(:stores_template) }

    it 'updates the resource' do
      expect(StoresTemplateResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { StoresTemplate.count }.by(-1)
      expect { storage_container_template.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end


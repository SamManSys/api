require 'rails_helper'

RSpec.describe "containers" do
  describe "stores#destroy", type: :request do
    subject(:make_request) do
      jsonapi_delete "/api/v1/containers/stores/#{storage_container.id}"
    end

    describe 'basic destroy' do
      let!(:storage_container) { create(:storage_container) }

      it 'updates the resource' do
        expect(Containers::StoreResource).to receive(:find).and_call_original
        expect {
          make_request
          expect(response.status).to eq(200), response.body
        }.to change { StorageContainer.count }.by(-1)
        expect { storage_container.reload }
          .to raise_error(ActiveRecord::RecordNotFound)
        expect(json).to eq('meta' => {})
      end
    end
  end
end

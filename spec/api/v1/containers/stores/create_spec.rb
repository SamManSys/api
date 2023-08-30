require 'rails_helper'

RSpec.describe "containers" do
  describe "stores#create", type: :request do
    subject(:make_request) do
      jsonapi_post "/api/v1/containers/stores", payload
    end

    describe 'basic create' do
      let(:params) do
        attributes_for(:storage_container)
      end
      let(:storage_container_template) do
        create(:storage_container_template)
      end

      let(:payload) do
        {
          data: {
            type: 'stores',
            attributes: params,
            relationships: {
              template: {
                data: {
                  type: 'templates',
                  id: storage_container_template.id.to_s
                }
              }
            }
          }
        }
      end

      it 'works' do
        expect(Containers::StoreResource).to receive(:build).and_call_original
        expect {
          make_request
          expect(response.status).to eq(201), response.body
        }.to change { StorageContainer.count }.by(1)
      end
    end
  end

end

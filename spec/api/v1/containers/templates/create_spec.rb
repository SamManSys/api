require 'rails_helper'

RSpec.describe "containers" do
  describe "templates#create", type: :request do
    subject(:make_request) do
      jsonapi_post "/api/v1/containers/templates", payload
    end

    describe 'basic create' do
      let(:params) do
        attributes_for(:storage_container_template)
      end
      let(:payload) do
        {
          data: {
            type: 'templates',
            attributes: params
          }
        }
      end

      it 'works' do
        expect(Containers::TemplateResource).to receive(:build).and_call_original
        expect {
          make_request
          expect(response.status).to eq(201), response.body
        }.to change { StorageContainerTemplate.count }.by(1)
      end
    end
  end
end

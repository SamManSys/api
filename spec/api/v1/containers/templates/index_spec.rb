require 'rails_helper'

RSpec.describe "containes" do
  describe "templates#index", type: :request do
    let(:params) { {} }

    subject(:make_request) do
      jsonapi_get "/api/v1/containers/templates", params: params
    end

    describe 'basic fetch' do
      let!(:storage_container_template1) { create(:storage_container_template) }
      let!(:storage_container_template2) { create(:storage_container_template) }

      it 'works' do
        expect(Containers::TemplateResource).to receive(:all).and_call_original
        make_request
        expect(response.status).to eq(200), response.body
        expect(d.map(&:jsonapi_type).uniq).to match_array(['templates'])
        expect(d.map(&:id)).to match_array([storage_container_template1.id, storage_container_template2.id])
      end
    end
  end
end

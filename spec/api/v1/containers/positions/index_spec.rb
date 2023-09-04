require 'rails_helper'

RSpec.describe "stores" do
  describe "positions#index", type: :request do
    let(:params) { {} }

    subject(:make_request) do
      jsonapi_get "/api/v1/stores_positions", params: params
    end

    describe 'basic fetch' do
      let!(:storage_container_position1) { create(:stores_position) }
      let!(:storage_container_position2) { create(:stores_position) }

      it 'works' do
        expect(StoresPositionResource).to receive(:all).and_call_original
        make_request
        expect(response.status).to eq(200), response.body
        expect(d.map(&:jsonapi_type).uniq).to match_array(['stores_positions'])
        expect(d.map(&:id)).to match_array([storage_container_position1.id, storage_container_position2.id])
      end
    end
  end
end

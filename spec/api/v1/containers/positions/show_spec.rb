require 'rails_helper'

describe "stores_positions#show", type: :request do
let(:params) { {} }

subject(:make_request) do
  jsonapi_get "/api/v1/stores_positions/#{storage_container_position.id}", params: params
end

describe 'basic fetch' do
  let!(:storage_container_position) { create(:stores_position) }

  it 'works' do
    expect(StoresPositionResource).to receive(:find).and_call_original
    make_request
    expect(response.status).to eq(200)
    expect(d.jsonapi_type).to eq('stores_positions')
    expect(d.id).to eq(storage_container_position.id)
  end
end
end
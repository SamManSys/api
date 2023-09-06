require 'rails_helper'

RSpec.describe "Invalid tokens", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/samples", params: params, headers: {'HTTP_AUTHORIZATION': expired_token}
  end

  it 'rejects expired' do
    make_request
    expect(response.status).to eq(401)
  end
end
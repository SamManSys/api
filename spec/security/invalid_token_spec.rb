require 'rails_helper'

RSpec.describe "Invalid tokens", type: :request do
  let(:params) { {} }

  it 'rejects expired' do
    jsonapi_get "/api/v1/samples", params: params, headers: {'HTTP_AUTHORIZATION': expired_token}
    expect(response.status).to eq(401)
  end

  it 'rejects invalid signature' do
    jsonapi_get "/api/v1/samples", params: params, headers: {'HTTP_AUTHORIZATION': invalid_signature}
    expect(response.status).to eq(401)
  end

  it 'rejects invalid signature alogrithm' do
    jsonapi_get "/api/v1/samples", params: params, headers: {'HTTP_AUTHORIZATION': invalid_signature_alg}
    expect(response.status).to eq(401)
  end

  it 'rejects invalid iss' do
    jsonapi_get "/api/v1/samples", params: params, headers: {'HTTP_AUTHORIZATION': invalid_iss}
    expect(response.status).to eq(401)
  end
end

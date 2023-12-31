require 'rails_helper'

RSpec.describe "samples#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/samples/#{sample.id}", params: params
  end

  describe 'basic fetch' do
    let!(:sample) { create(:sample) }

    it 'works' do
      expect(SampleResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('samples')
      expect(d.id).to eq(sample.id)
    end
  end
end

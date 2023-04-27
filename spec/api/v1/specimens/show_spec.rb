require 'rails_helper'

RSpec.describe "specimens#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/specimens/#{specimen.id}", params: params
  end

  describe 'basic fetch' do
    let!(:specimen) { create(:specimen) }

    it 'works' do
      expect(SpecimenResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('specimens')
      expect(d.id).to eq(specimen.id)
    end
  end
end

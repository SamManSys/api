require 'rails_helper'

RSpec.describe "specimens#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/specimens", params: params
  end

  describe 'basic fetch' do
    let!(:specimen1) { create(:specimen) }
    let!(:specimen2) { create(:specimen) }

    it 'works' do
      expect(SpecimenResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['specimens'])
      expect(d.map(&:id)).to match_array([specimen1.id, specimen2.id])
    end
  end
end

require 'rails_helper'

RSpec.describe "patients#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/patients", params: params
  end

  describe 'basic fetch' do
    let!(:patient1) { create(:patient) }
    let!(:patient2) { create(:patient) }

    it 'works' do
      expect(PatientResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['patients'])
      expect(d.map(&:id)).to match_array([patient1.id, patient2.id])
    end
  end
end

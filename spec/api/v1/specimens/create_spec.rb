require 'rails_helper'

RSpec.describe "specimens#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/specimens", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:specimen)
    end
    let(:payload) do
      {
        data: {
          type: 'specimens',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SpecimenResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Specimen.count }.by(1)
    end
  end
end

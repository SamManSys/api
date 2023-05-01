require 'rails_helper'

RSpec.describe "patients#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/patients", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:patient)
    end
    let(:payload) do
      {
        data: {
          type: 'patients',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(PatientResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Patient.count }.by(1)
    end
  end
end

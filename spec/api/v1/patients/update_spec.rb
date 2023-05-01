require 'rails_helper'

RSpec.describe "patients#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/patients/#{patient.id}", payload
  end

  describe 'basic update' do
    let!(:patient) { create(:patient) }

    let(:payload) do
      {
        data: {
          id: patient.id.to_s,
          type: 'patients',
          attributes: {
            firstname: Faker::Name.first_name,
            surname: Faker::Name.last_name
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(PatientResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { patient.reload.attributes }
    end
  end
end

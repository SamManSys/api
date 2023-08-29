require 'rails_helper'

RSpec.describe "questionnaires", type: :request do
  describe "responses#show", type: :request do
    let(:params) { {} }

    subject(:make_request) do
      jsonapi_get "/api/v1/questionnaires/responses/#{consent_questionnaire_response.id}", params: params
    end

    describe 'basic fetch' do
      let!(:consent_questionnaire_response) { create(:consent_questionnaire_response) }

      it 'works' do
        expect(Questionnaires::ResponseResource).to receive(:find).and_call_original
        make_request
        expect(response.status).to eq(200)
        expect(d.jsonapi_type).to eq('responses')
        expect(d.id).to eq(consent_questionnaire_response.id)
      end
    end
  end
end
require 'rails_helper'

describe "questionnaires_forms#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/questionnaires_forms/#{questionnaires_form.id}", params: params
  end

  describe 'basic fetch' do
    let!(:questionnaires_form) { create(:questionnaires_form) }

    it 'works' do
      expect(QuestionnairesFormResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('questionnaires_forms')
      expect(d.id).to eq(questionnaires_form.id)
    end
  end
end

require 'rails_helper'

describe "questionnaires_forms#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/questionnaires_forms", params: params
  end

  describe 'basic fetch' do
    let!(:questionnaires_form1) { create(:questionnaires_form) }
    let!(:questionnaires_form2) { create(:questionnaires_form) }

    it 'works' do
      expect(QuestionnairesFormResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['questionnaires_forms'])
      expect(d.map(&:id)).to match_array([questionnaires_form1.id, questionnaires_form2.id])
    end
  end
end

require 'rails_helper'

describe "questionnaires_forms#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/questionnaires_forms/#{questionnaires_form.id}"
  end

  describe 'basic destroy' do
    let!(:questionnaires_form) { create(:questionnaires_form) }

    it 'updates the resource' do
      expect(QuestionnairesFormResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { QuestionnairesForm.count }.by(-1)
      expect { questionnaires_form.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end


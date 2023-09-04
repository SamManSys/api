require 'rails_helper'

describe "questionnaires_forms#create", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/questionnaires_forms/#{questionnaires_form.id}", payload
  end

  describe 'basic update' do
    let!(:questionnaires_form) { create(:questionnaires_form) }

    let(:payload) do
      {
        data: {
          id: questionnaires_form.id.to_s,
          type: 'questionnaires_forms',
          attributes: {
            witness_name: Faker::Name.name
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(QuestionnairesFormResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { questionnaires_form.reload.attributes }
    end
  end
end


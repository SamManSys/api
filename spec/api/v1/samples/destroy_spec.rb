require 'rails_helper'

RSpec.describe "samples#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/samples/#{specimen.id}"
  end

  describe 'basic destroy' do
    let!(:specimen) { create(:specimen) }

    it 'updates the resource' do
      expect(SampleResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Specimen.count }.by(-1)
      expect { specimen.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

require 'rails_helper'

RSpec.describe "samples#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/samples/#{sample.id}", payload
  end

  describe 'basic update' do
    let!(:sample) { create(:sample) }

    let(:payload) do
      {
        data: {
          id: sample.id.to_s,
          type: 'samples',
          attributes: {
            label: 'bar'
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(SampleResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { sample.reload.label }.to eq('bar')
    end
  end
end

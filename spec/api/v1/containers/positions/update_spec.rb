require 'rails_helper'

describe "stores_positions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/stores_positions/#{storage_container_position.id}", payload
  end

  describe 'basic update' do
    let!(:storage_container_position) { create(:stores_position) }    
    let!(:specimen) { create(:sample) }
    let(:payload) do
      {
        data: {
          id: storage_container_position.id.to_s,
          type: 'stores_positions',
          attributes: { },
          relationships: {
            content: {
              data: {
                type: 'samples',
                id: specimen.id
              } 
            }  
          }
        }
      }        
    end
    it 'can contain a specimen' do
      expect(StoresPositionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { storage_container_position.reload.attributes }
    end
  end
end

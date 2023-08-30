require 'rails_helper'

RSpec.describe "containers" do
  describe "positions#update", type: :request do
    subject(:make_request) do
      jsonapi_put "/api/v1/containers/positions/#{storage_container_position.id}", payload
    end

    describe 'basic update' do
      let!(:storage_container_position) { create(:storage_container_position) }    
      let!(:specimen) { create(:specimen) }
      let(:payload) do
        {
          data: {
            id: storage_container_position.id.to_s,
            type: 'positions',
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
        expect(Containers::PositionResource).to receive(:find).and_call_original
        expect {
          make_request
          expect(response.status).to eq(200), response.body
        }.to change { storage_container_position.reload.attributes }
      end
    end
  end
end

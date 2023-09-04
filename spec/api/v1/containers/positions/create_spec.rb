require 'rails_helper'

RSpec.describe "containers", type: :request do
  describe "positions#create", type: :request do
    subject(:make_request) do
      jsonapi_post "/api/v1/containers/positions", payload
    end

    describe 'basic create' do
      let(:params) do
        attributes_for(:stores_position)
      end
      let(:storage_container) {
        create(:stores_container)
      }

      let(:payload) do
        {
          data: {
            type: 'stores_position',
            attributes: params,
            relationships: {
              stores_container: {
                data: {
                  type: 'stores_container',
                  id: storage_container.id.to_s
                }
              }
            }
          }
        }
      end

      it 'will not allow a consumer to create' do        
        expect {
          make_request          
        }.to raise_error ActionController::RoutingError
      end
    end
  end

end

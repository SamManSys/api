require 'rails_helper'

RSpec.describe "containers", type: :request do
  describe "positions#create", type: :request do
    subject(:make_request) do
      jsonapi_post "/api/v1/containers/positions", payload
    end

    describe 'basic create' do
      let(:params) do
        attributes_for(:storage_container_position)
      end
      let(:storage_container) {
        create(:storage_container)
      }

      let(:payload) do
        {
          data: {
            type: 'positions',
            attributes: params,
            relationships: {
              store: {
                data: {
                  type: 'stores',
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

require 'rails_helper'

RSpec.describe "Containers", type: :resource do
  describe Containers::PositionResource, type: :resource do
    describe 'add specimen via update' do
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
                  type: 'specimens',
                  id: specimen.id
                }
              }
            }
          }
        }
      end
  
      let(:instance) do
        Containers::PositionResource.find(payload)
      end
  
      it 'stores items in the content polymorphic' do
        expect {
          expect(instance.update_attributes).to eq(true)
        }.to change { storage_container_position.reload.content_id }
         .and change { storage_container_position.content_type }.to("specimen")
      end
    end
    describe 'add container via update' do
      let!(:storage_container_position) { create(:storage_container_position) }
      let!(:storage_container) { create(:storage_container) }      
      let(:payload) do
        {
          data: {
            id: storage_container_position.id.to_s,
            type: 'positions',
            attributes: { },
            relationships: {
              content: {
                data: {
                  type: 'stores',
                  id: storage_container.id
                }
              }
            }
          }
        }
      end
  
      let(:instance) do
        Containers::PositionResource.find(payload)
      end
  
      it 'stores items in the content polymorphic' do
        expect {
          expect(instance.update_attributes).to eq(true)
        }.to change { storage_container_position.reload.content_id }
         .and change { storage_container_position.content_type }.to("storage_container")
      end
    end
  end  
end

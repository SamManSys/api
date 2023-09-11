require 'rails_helper'

describe StoresPositionResource, type: :resource do
  describe 'add sample via update' do
    let!(:stores_position) { create(:stores_position) }
    let!(:sample) { create(:sample) }      
    let(:payload) do
      {
        data: {
          id: stores_position.id.to_s,
          type: 'stores_positions',
          attributes: { },
          relationships: {
            content: {
              data: {
                type: 'samples',
                id: sample.id
              }
            }
          }
        }
      }
    end

    let(:instance) do
      StoresPositionResource.find(payload)
    end

    it 'stores items in the content polymorphic' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { stores_position.reload.content_id }
        .and change { stores_position.content_type }.to("sample")
    end
  end
  describe 'add container via update' do
    let!(:stores_position) { create(:stores_position) }
    let!(:stores_container) { create(:stores_container) }      
    let(:payload) do
      {
        data: {
          id: stores_position.id.to_s,
          type: 'stores_positions',
          attributes: { },
          relationships: {
            content: {
              data: {
                type: 'stores_containers',
                id: stores_container.id
              }
            }
          }
        }
      }
    end

    let(:instance) do
      StoresPositionResource.find(payload)
    end

    it 'stores items in the content polymorphic' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { stores_position.reload.content_id }
        .and change { stores_position.content_type }.to("stores_container")
    end
  end
end  


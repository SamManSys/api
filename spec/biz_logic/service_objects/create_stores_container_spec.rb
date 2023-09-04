require 'rails_helper'

RSpec.describe ServiceObjects::CreateStoresContainer do
  let(:stores_template) { create(:stores_template, :four_by_four)}
  subject(:so) do
    ServiceObjects::CreateStoresContainer.new(stores_template)
  end
  describe "provides the attributes of positions" do
    it "can format them as number by number" do
      so.build_container_object("test")
      so.first_type = 'Numbers'
      so.second_type = 'Numbers'

      expect(so.attributes.count).to eq(16)
      expect(so.attributes.first[:position_x]).to eq(1)
      expect(so.attributes.first[:position_y]).to eq(1)
      expect(so.attributes.last[:position_x]).to eq(4)
      expect(so.attributes.last[:position_y]).to eq(4)
    end

    it "can format them as number by letter" do
      so.build_container_object("test")
      so.first_type = 'Letters'
      so.second_type = 'Numbers'

      expect(so.attributes.count).to eq(16)
      expect(so.attributes.first[:position_x]).to eq("A")
      expect(so.attributes.first[:position_y]).to eq(1)
      expect(so.attributes.last[:position_x]).to eq("D")
      expect(so.attributes.last[:position_y]).to eq(4)      
    end

    it "can format them as letter by number" do
      so.build_container_object("test")
      so.first_type = 'Numbers'
      so.second_type = 'Letters'

      expect(so.attributes.count).to eq(16)
      expect(so.attributes.first[:position_x]).to eq(1)
      expect(so.attributes.first[:position_y]).to eq("A")
      expect(so.attributes.last[:position_x]).to eq(4)
      expect(so.attributes.last[:position_y]).to eq("D")      
    end

    it "can format them as letter by letter" do
      so.build_container_object("test")
      so.first_type = 'Letters'
      so.second_type = 'Letters'

      expect(so.attributes.count).to eq(16)
      expect(so.attributes.first[:position_x]).to eq("A")
      expect(so.attributes.first[:position_y]).to eq("A")
      expect(so.attributes.last[:position_x]).to eq("D")
      expect(so.attributes.last[:position_y]).to eq("D")      
    end
  end

  describe "Database records" do
    it "creates the container" do
      expect {
        so.create_with_name_of("test container")
      }.to change{StoresContainer.count}.by(1)
    end

    it "creates the positions" do
      expect {
        so.create_with_name_of("test container")
      }.to change{StoresPosition.count}.by(16)
    end
  end
end

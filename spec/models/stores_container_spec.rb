require 'rails_helper'

RSpec.describe StoresContainer, :type => :model do
  describe "Validates presence of" do
    let(:storage_container) { build(:stores_container) }

    [:name, :size_x, :size_y].each do |field|
      it "#{field.to_s}" do
        storage_container.public_send("#{field}=", nil)

        expect(storage_container).not_to be_valid
      end
    end
  end

  describe "Positions" do
    it "creates them based on dimentions of container" do
      expect {
        create(:stores_container, :four_by_four)
      }.to change { StoresPosition.count }.by(16)
    end

    it "creates 100 positions in under 250 ms", :perf => true do
      expect {
        create(:stores_container, :ten_by_ten)
      }.to perform_under(250).ms
      
      # Above test runs more than once
      expect(StoresPosition.where(stores_container: StoresContainer.first).count)
             .to eq(100)
    end
  end
end
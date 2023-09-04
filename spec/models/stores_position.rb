require 'rails_helper'

RSpec.describe StoresPosition, :type => :model do
  describe "Validates presence of" do
    let(:storage_container_position) { build(:storage_container_position) }

    [:position_x, :position_y].each do |field|
      it "#{field.to_s}" do
        storage_container_position.public_send("#{field}=", nil)

        expect(storage_container_position).not_to be_valid
      end
    end
  end
end
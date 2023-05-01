require 'rails_helper'

RSpec.describe StorageContainer, :type => :model do
  describe "Validates presence of" do
    let(:storage_container) { build(:storage_container) }

    [:name, :size_x, :size_y].each do |field|
      it "#{field.to_s}" do
        storage_container.public_send("#{field}=", nil)

        expect(storage_container).not_to be_valid
      end
    end
  end
end
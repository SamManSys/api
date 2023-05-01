require 'rails_helper'

RSpec.describe StorageContainerTemplate, :type => :model do
  describe "Validates presence of" do
    let(:storage_container_template) { build(:storage_container_template) }
    [:label_x, :label_y, :size_x, :size_y, :name].each do |field|
      it "#{field.to_s}" do
        storage_container_template.public_send("#{field}=", nil)

        expect(storage_container_template).not_to be_valid
      end
    end
  end
end
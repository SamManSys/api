require 'rails_helper'

RSpec.describe CollectionProtocol, :type => :model do
  describe "Validates presence of" do
    let(:collection_protocol) { build(:collection_protocol) }
    [:start_date, :short_protocol_name].each do |field|
      it "#{field.to_s}" do
        collection_protocol.public_send("#{field}=", nil)

        expect(collection_protocol).not_to be_valid
      end
    end
  end

  describe "is disabled" do
    before(:each) do
      create(:collection_protocol, :disabled)
    end

    it "is not normally visible" do
      expect(CollectionProtocol.all).to be_empty
    end
  end

  describe "is closed" do
    let(:collection_protocol) { create(:collection_protocol, :closed) }

    it "is not possible to update" do
      collection_protocol.start_date = Date.yesterday
      expect(collection_protocol.save).to be_falsey
      expect(collection_protocol.errors).not_to be_empty
      expect(collection_protocol.errors.where(:base).first.full_message).to eq("Collection protocol is closed. It cannot be updated")      
    end
  end
end
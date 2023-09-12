require 'rails_helper'

RSpec.describe ServiceModules::StatusableResource do
  let(:dummy_class) do
    Class.new {
      extend ServiceModules::StatusableResource
    }
  end

  it "to disabled when disabled" do
    def dummy_class.status
      'disabled'
    end
    expect(dummy_class).to be_disabled
  end

  it "to active when active" do
    def dummy_class.status
      'active'
    end
    expect(dummy_class).to be_active
  end

  it "to closed when closed" do
    def dummy_class.status
      'closed'
    end
    expect(dummy_class).to be_closed
  end

end

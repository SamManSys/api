require 'rails_helper' 

RSpec.describe ServiceModules::StatusableResource::Validators do
  describe "Model with StatusableResource" do
    class TestClass    
      include ServiceModules::StatusableResource::DefaultScope

      def self.not(query={})

      end
      def self.where(query={})
        self
      end
    end
    it "sets the default scope" do
      allow(TestClass).to receive(:not)

      TestClass.default_scope

      expect(TestClass).to have_received(:not).with(status: ServiceModules::StatusableResource::Types::DISABLED)
    end
  end
end
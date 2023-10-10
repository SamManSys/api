require 'rails_helper' 

RSpec.describe ServiceModules::StatusableResource::Validators do
  describe "Model with StatusableResource" do
    class TestClass    
      include ActiveModel::Validations
      include ActiveModel::Dirty
      include ServiceModules::StatusableResource::Checks
      include ServiceModules::StatusableResource::Validators

      define_attribute_methods :status
      def initialize(status)
        @status = status
      end

      def save
        self._run_save_callbacks        
      end

      def status
        @status
      end
  
      def status=(value)
        status_will_change!
        @status = value
      end
    end

    it "is expected to add a before_save validator" do      
      expect(TestClass.__callbacks[:save]).to_not be_empty     
    end

    it "is not valid to save a closed record" do
      expect(TestClass.new('closed').save).to be_falsey
    end

    it "is not valid to save a closed record" do
      expect(TestClass.new('closed').save).to be_falsey
    end

    it "is valid to save an active record" do
      expect(TestClass.new('active').save).to be_truthy
    end

    it "is valid to make an active record closed" do
      tc = TestClass.new('active')
      tc.status = 'closed'
      expect(tc.save).to be_truthy
    end
  end
end
require 'rails_helper'

RSpec.describe ClosedValidator do
  class ClassWithStatus
    include ActiveModel::Validations
    include ActiveModel::Dirty

    validates_with ClosedValidator
    
    define_attribute_methods :status
    def initialize(status)
      @status = status
    end

    def self.as_active
      ClassWithStatus.new("active")
    end

    def self.as_closed
      ClassWithStatus.new("closed")
    end

    def status
      @status
    end

    def status=(value)
      status_will_change!
      @status = value
    end
  end

  describe "Record with status closed" do
    it "is not valid" do
      cws = ClassWithStatus.as_closed

      expect(cws).to_not be_valid
    end

    it "can be made closed" do
      cws = ClassWithStatus.as_active
      cws.status = "closed"

      expect(cws).to be_valid
    end
  end
end
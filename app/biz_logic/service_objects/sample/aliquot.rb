module ServiceObjects::Sample
  class Aliquot
    def initialize(id)
      @sample = Sample.find_by_id(id)      
      @new_samples = []
    end

    def perform(num)
      1.upto(num) do |i|
        new_sample = copy_sample
        new_sample.label += "/A#{i}"
        new_sample.save!
        @new_samples.push(new_sample)
      end
    end
  
    def original_sample
      @sample
    end

    def new_samples
      @new_samples
    end

    def copy_sample
      Sample.new :label => @sample.label,
                 :sample_class => @sample.sample_class,
                 :sample_type => @sample.sample_type,
                 :barcode => "CHANGE THIS",
                 :sample_collection => @sample.sample_collection
    end
  end
end
module ServiceObjects
  class CreateStoresContainer
    attr_accessor :first_type, :second_type

    def initialize(template)
      if template.is_a? StoresTemplate
        @template = template
      else
        @template = StoresTemplate.find_by_name(template)
      end
      raise ArgumentError, "The template #{template} was not found" if @template.nil?
    end

    def create_with_name_of(name, type_x='Numbers', type_y='Numbers')
      @first_type = type_x
      @second_type = type_y
      StoresContainer.transaction do
        build_container_object(name)
        build_positions_rails6
      end
      return @stores
    end

    def build_container_object(name)
      @stores = StoresContainer.create!(
        stores_template_id: @template.id,
        name: name,
        size_x: @template.size_x,
        size_y: @template.size_y
      )

    end

    def build_positions_rails6
      StoresPosition.insert_all(attributes)
    end

    def attributes
      stores_id = @stores.id
      range_x.collect { |x|
        range_y.collect { |y|
          {stores_container_id: stores_id, position_x: x, position_y: y}
        }
      }.flatten
    end

    def range_x
      range = @first_type == 'Numbers' ? (1..@template.size_x) : ("A".."Z").first(@template.size_x)
      if block_given?
        range.to_a.each do |r|
          yield r
        end
      end

      return range
    end

    def range_y
      range = @second_type == 'Numbers' ? (1..@template.size_y) : ("A".."Z").first(@template.size_y)
      if block_given?
        range.to_a.each do |r|
          yield r
        end
      end

      return range
    end
  end
end
class SampleResource < ApplicationResource
  belongs_to :sample_collection
  
  attribute :label, :string
  attribute :barcode, :string
  attribute :sample_class, :string
  attribute :sample_type, :string
  attribute :comments, :string, sortable: false
  attribute :born_on, :date
  attribute :status, :string
  attribute :site, :string
  attribute :side, :string
  attribute :availability, :string
  attribute :available_quantity, :float
  
  attribute :sample_collection_id, :integer, only: [:filterable]
  
  primary_endpoint '/samples', [:index, :show, :create, :update, :destroy, :aliquot]

  def self.allow_request?(request_path, params, action)
    request_path = request_path.split(".")[0]
    
    endpoints.any? do |e|
      has_id = params[:id] || params[:data].try(:[], :id)
      path = request_path
      if [:aliquot].include?(context_namespace) 
        path = request_path.split("/")
        path.pop
        path.pop
        path = path.join("/")        
      end
      if [:update, :show, :destroy].include?(context_namespace) && has_id
        path = request_path.split("/")
        path.pop
        path = path.join("/")
      end
  
      e[:full_path].to_s == path && e[:actions].include?(context_namespace)
    end
  end
end

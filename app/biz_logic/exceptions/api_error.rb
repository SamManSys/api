module Exceptions
  class ApiError < StandardError
    attr_reader :status, :code, :title, :detail

    def initialize(option = {})
      super
      @status = option[:status] || 400
      @code   = option[:code]   || 400
      @title  = option[:title]  || 'Bad Request'
      @detail = option[:detail] || ''
    end
  
    def hash
      {
        'errors': [
          {
            'title': title,
            'detail': detail,
            'code': code,
            'status': status
          }    
        ]
      }
    end
  
    def as_json(*)
      hash
    end    
  end
end
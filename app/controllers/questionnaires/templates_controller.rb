module Questionnaires
  class TemplatesController < ApplicationController
    def index
      templates = TemplateResource.all(params)
      respond_with(templates)
    end
  end
end

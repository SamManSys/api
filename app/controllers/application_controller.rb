class ApplicationController < ActionController::API
  include Graphiti::Rails::Responders
  before_action :validate_authorization

  rescue_from Exceptions::SecurityError, with: :security_errors

  private

  def validate_authorization
    validate_token! bearer_token
  end

  def validate_token!(token)
    begin
      JsonWebToken.verify!(token)
    rescue JWT::DecodeError
      raise Exceptions::SecurityError
    end
  end

  def bearer_token
    http_authorization.gsub('Bearer ', '')
  end

  def http_authorization
    @http_authorization ||= request.headers['HTTP_AUTHORIZATION'] || ''
  end

  def security_errors(exception)
    render json: exception, status: exception.status
  end
end

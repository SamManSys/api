class JsonWebToken
  def self.verify!(token)
    check = new token
    check.verify!
  end

  def initialize(token)
    @token = token
  end

  def verify!
      JWT.decode(@token, secret, true, algorithm: algorithm, iss: iss, verify_iss: true, aud: aud, verify_aud: true)
  end

  private
  def iss
    oauth2[:iss]
  end

  def algorithm
    oauth2[:algorithm]
  end

  def aud
    oauth2[:aud]
  end

  def secret
    oauth2[:secret]
  end

  def oauth2
    Rails.application.credentials.oauth2
  end
end
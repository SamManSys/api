module JsonTokenHelper
  TOKEN_TEMPLATE = 
  {
      "oauthClientId": "sammansys",
      "displayName": "Test User",
      "roles": [],
      "iss": "https://www.ecmc.ed.ac.uk/cas",
      "client_id": "sammansys",
      "uid": "testuser",
      "grant_type": "AUTHORIZATION_CODE",
      "permissions": [],
      "scope": [],
      "memberOf": [
        "cn=harbor_admins,ou=groups,dc=ecmc,dc=ed,dc=ac,dc=uk",
        "cn=cruk-tg,ou=sammansys,ou=groups,dc=ecmc,dc=ed,dc=ac,dc=uk",
        "cn=ohdsi,ou=groups,dc=ecmc,dc=ed,dc=ac,dc=uk",
        "cn=nhs_admins,ou=groups,dc=ecmc,dc=ed,dc=ac,dc=uk"
      ],
      "jti": "AT-8-qqFk3EPKJGr-3KQDy6DvD8oWV7-O7EvF",
      "aud": "https://oauth.pstmn.io/v1/callback",
      "scopes": []
    }
  def valid_token
    start = DateTime.now
    dates = {
      "exp": start.next_day.strftime('%s').to_i,
      "iat": start.strftime('%s').to_i,
    }
    payload = JsonTokenHelper::TOKEN_TEMPLATE.merge(dates)
    JWT.encode payload, Rails.application.credentials.oauth2[:secret], 'HS512'
  end

  def expired_token
    start = DateTime.now.prev_day
    dates = {
      "exp": start.next_day.strftime('%s').to_i,
      "iat": start.strftime('%s').to_i,
    }
    payload = JsonTokenHelper::TOKEN_TEMPLATE.merge(dates)
    JWT.encode payload, Rails.application.credentials.oauth2[:secret], 'HS512'    
  end

  def invalid_signature
    start = DateTime.now
    dates = {
      "exp": start.next_day.strftime('%s').to_i,
      "iat": start.strftime('%s').to_i,
    }
    payload = JsonTokenHelper::TOKEN_TEMPLATE.merge(dates)
    JWT.encode payload, 'BadSecret', 'HS512'
  end

  def invalid_signature_alg
    start = DateTime.now
    dates = {
      "exp": start.next_day.strftime('%s').to_i,
      "iat": start.strftime('%s').to_i,
    }
    payload = JsonTokenHelper::TOKEN_TEMPLATE.merge(dates)
    JWT.encode payload, Rails.application.credentials.oauth2[:secret], 'HS256'
  end

  def invalid_iss
    start = DateTime.now
    dates = {
      "exp": start.next_day.strftime('%s').to_i,
      "iat": start.strftime('%s').to_i,
      "iss": "https://www.example.com"
    }
    payload = JsonTokenHelper::TOKEN_TEMPLATE.merge(dates)
    JWT.encode payload, Rails.application.credentials.oauth2[:secret], 'HS512'
  end

  def jsonapi_headers
    media_type = 'application/vnd.api+json'
    {
      'CONTENT_TYPE' => media_type,
      'HTTP_ACCEPT' => media_type,
      'HTTP_AUTHORIZATION': valid_token
    }
  end
end